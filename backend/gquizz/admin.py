from django.contrib import admin
from .models import Category, Question


@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    """
    Configuration de l'admin pour le modèle Category
    """
    list_display = ['name', 'slug', 'created_at']
    search_fields = ['name', 'description']
    prepopulated_fields = {'slug': ('name',)}
    list_filter = ['created_at']
    ordering = ['name']


@admin.register(Question)
class QuestionAdmin(admin.ModelAdmin):
    """
    Configuration de l'admin pour le modèle Question
    """
    list_display = [
        'question_text_short',
        'category',
        'difficulty',
        'is_active',
        'created_at'
    ]
    list_filter = ['difficulty', 'category', 'is_active', 'created_at']
    search_fields = ['question_text', 'explanation']
    list_editable = ['is_active']
    ordering = ['-created_at']
    
    fieldsets = (
        ('Question', {
            'fields': ('question_text', 'category', 'difficulty')
        }),
        ('Réponses', {
            'fields': ('option_a', 'option_b', 'option_c', 'option_d', 'correct_answer')
        }),
        ('Informations supplémentaires', {
            'fields': ('explanation', 'is_active'),
            'classes': ('collapse',)
        }),
    )
    
    def question_text_short(self, obj):
        """Affiche les 50 premiers caractères de la question"""
        if len(obj.question_text) > 50:
            return obj.question_text[:50] + "..."
        return obj.question_text
    question_text_short.short_description = 'Question'