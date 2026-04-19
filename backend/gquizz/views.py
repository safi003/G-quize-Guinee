from rest_framework import viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response

from .models import Category, Question
from .serializers import (
    CategorySerializer,
    QuestionListSerializer,
    QuestionDetailSerializer,
    QuestionAnswerSerializer
)


class CategoryViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer


class QuestionViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Question.objects.filter(is_active=True)
    serializer_class = QuestionDetailSerializer
    
    def get_serializer_class(self):
        if self.action == 'list':
            return QuestionListSerializer
        elif self.action == 'check_answer':
            return QuestionAnswerSerializer
        return QuestionDetailSerializer
    
    @action(detail=False, methods=['get'])
    def random(self, request):
        difficulty = request.query_params.get('difficulty', None)
        category_id = request.query_params.get('category', None)
        limit = int(request.query_params.get('limit', 10))
        
        if limit > 50:
            limit = 50
        
        queryset = Question.objects.filter(is_active=True)
        
        if difficulty and difficulty in ['facile', 'moyen', 'difficile']:
            queryset = queryset.filter(difficulty=difficulty)
        
        if category_id:
            queryset = queryset.filter(category_id=category_id)
        
        total_questions = queryset.count()
        
        if total_questions == 0:
            return Response(
                {"error": "Aucune question trouvée avec ces critères"},
                status=status.HTTP_404_NOT_FOUND
            )
        
        if total_questions < limit:
            limit = total_questions
        
        questions = queryset.order_by('?')[:limit]
        serializer = self.get_serializer(questions, many=True)
        
        return Response({
            'count': len(serializer.data),
            'difficulty': difficulty,
            'category': category_id,
            'questions': serializer.data
        })
    
    @action(detail=True, methods=['post'])
    def check_answer(self, request, pk=None):
        question = self.get_object()
        user_answer = request.data.get('answer', None)
        
        if user_answer is None:
            return Response(
                {"error": "Le champ 'answer' est requis"},
                status=status.HTTP_400_BAD_REQUEST
            )
        
        try:
            user_answer = int(user_answer)
        except (ValueError, TypeError):
            return Response(
                {"error": "La réponse doit être un nombre entre 0 et 3"},
                status=status.HTTP_400_BAD_REQUEST
            )
        
        if user_answer not in [0, 1, 2, 3]:
            return Response(
                {"error": "La réponse doit être 0, 1, 2 ou 3"},
                status=status.HTTP_400_BAD_REQUEST
            )
        
        is_correct = (user_answer == question.correct_answer)
        serializer = QuestionAnswerSerializer(question)
        
        return Response({
            'is_correct': is_correct,
            'user_answer': user_answer,
            'correct_answer': question.correct_answer,
            'explanation': question.explanation or "",
            'question': serializer.data
        })