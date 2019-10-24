from django.contrib import admin

from .models import Choice, Question


class ChoiceInline(admin.TabularInline):
    model = Choice
    extra = 3


class QuestionAdmin(admin.ModelAdmin):
    fieldsets = [
        (None,               {'fields': ['question_text']}),
        ('Date information', {'fields': ['pub_date'], 'classes': ['collapse']}),
    ]
    inlines = [ChoiceInline]                # Link QuestionAdmin to ChoiceInLine.
    list_display = ('question_text', 'pub_date', 'was_published_recently')      #Fields displayed on Admin site
    list_filter = ['pub_date']                  # Adds a filter onto the admin site for pub_date
    search_fields = ['question_text']           #Adds a searchbox to Admin

admin.site.register(Question, QuestionAdmin)