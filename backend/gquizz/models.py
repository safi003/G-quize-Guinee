from django.db import models


class Category(models.Model):
    """
    Modèle pour les catégories de questions
    """
    name = models.CharField(max_length=100, verbose_name="Nom")
    slug = models.SlugField(unique=True, verbose_name="Slug")
    description = models.TextField(blank=True, null=True, verbose_name="Description")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Date de création")
    
    class Meta:
        verbose_name = "Catégorie"
        verbose_name_plural = "Catégories"
        ordering = ['name']
    
    def __str__(self):
        return self.name

class Question(models.Model):
    """
    Modèle pour les questions du quiz
    Chaque question a 4 options (A, B, C, D) et une seule bonne réponse
    """
    
    # Choix pour le niveau de difficulté
    DIFFICULTY_CHOICES = [
        ('facile', 'Facile'),
        ('moyen', 'Moyen'),
        ('difficile', 'Difficile'),
    ]
    
    # Choix pour la bonne réponse
    ANSWER_CHOICES = [
        (0, 'Option A'),
        (1, 'Option B'),
        (2, 'Option C'),
        (3, 'Option D'),
    ]
    
    # Champs de la question
    question_text = models.TextField(verbose_name="Question")
    option_a = models.CharField(max_length=200, verbose_name="Option A")
    option_b = models.CharField(max_length=200, verbose_name="Option B")
    option_c = models.CharField(max_length=200, verbose_name="Option C")
    option_d = models.CharField(max_length=200, verbose_name="Option D")
    
    correct_answer = models.IntegerField(
        choices=ANSWER_CHOICES,
        verbose_name="Réponse correcte"
    )
    
    difficulty = models.CharField(
        max_length=20,
        choices=DIFFICULTY_CHOICES,
        default='moyen',
        verbose_name="Difficulté"
    )
    
    category = models.ForeignKey(
        Category,
        on_delete=models.CASCADE,
        related_name='questions',
        verbose_name="Catégorie"
    )
    
    explanation = models.TextField(
        blank=True,
        null=True,
        verbose_name="Explication"
    )
    
    is_active = models.BooleanField(
        default=True,
        verbose_name="Active"
    )
    
    created_at = models.DateTimeField( auto_now_add=True, verbose_name="Date de création" )
    
    updated_at = models.DateTimeField( auto_now=True, verbose_name="Date de modification")
    
    class Meta:
        verbose_name = "Question"
        verbose_name_plural = "Questions"
        ordering = ['-created_at']
    
    def __str__(self):
        return self.question_text[:50] + "..." if len(self.question_text) > 50 else self.question_text