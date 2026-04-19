from rest_framework import serializers
from .models import Category, Question


class CategorySerializer(serializers.ModelSerializer):
    questions_count = serializers.SerializerMethodField()
    
    class Meta:
        model = Category
        fields = ['id', 'name', 'slug', 'description', 'questions_count', 'created_at']
        read_only_fields = ['id', 'created_at']
    
    def get_questions_count(self, obj):
        return obj.questions.filter(is_active=True).count()


class QuestionListSerializer(serializers.ModelSerializer):
    category_name = serializers.CharField(source='category.name', read_only=True)
    
    class Meta:
        model = Question
        fields = [
            'id',
            'question_text',
            'category',
            'category_name',
            'difficulty',
            'is_active',
            'created_at'
        ]
        read_only_fields = ['id', 'created_at']


class QuestionDetailSerializer(serializers.ModelSerializer):
    category_name = serializers.CharField(source='category.name', read_only=True)
    options = serializers.SerializerMethodField()
    
    class Meta:
        model = Question
        fields = [
            'id',
            'question_text',
            'category',
            'category_name',
            'difficulty',
            'options',
            'created_at'
        ]
        read_only_fields = ['id', 'created_at']
    
    def get_options(self, obj):
        return [
            {"index": 0, "text": obj.option_a},
            {"index": 1, "text": obj.option_b},
            {"index": 2, "text": obj.option_c},
            {"index": 3, "text": obj.option_d},
        ]


class QuestionAnswerSerializer(serializers.ModelSerializer):
    category_name = serializers.CharField(source='category.name', read_only=True)
    options = serializers.SerializerMethodField()
    
    class Meta:
        model = Question
        fields = [
            'id',
            'question_text',
            'category_name',
            'difficulty',
            'options',
            'correct_answer',
            'explanation'
        ]
    
    def get_options(self, obj):
        return [
            {
                "index": 0,
                "text": obj.option_a,
                "is_correct": obj.correct_answer == 0
            },
            {
                "index": 1,
                "text": obj.option_b,
                "is_correct": obj.correct_answer == 1
            },
            {
                "index": 2,
                "text": obj.option_c,
                "is_correct": obj.correct_answer == 2
            },
            {
                "index": 3,
                "text": obj.option_d,
                "is_correct": obj.correct_answer == 3
            },
        ]