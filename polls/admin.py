from django.contrib import admin

from .models import Choice, Question

# MJW:
# These classes are added to get the admin part of the Django project
# to represent the data in an intuitive way, including primary keys
# etc.


class ChoiceInline(admin.TabularInline):
    model = Choice
    extra = 3


class QuestionAdmin(admin.ModelAdmin):
    fieldsets = [
        (None,               {'fields': ['question_text']}),
        ('Date information',
            {
                'fields': ['pub_date'], 'classes': ['collapse']
            }
         ),
    ]
    # Link QuestionAdmin to ChoiceInLine.
    inlines = [ChoiceInline]
    # Fields displayed on Admin site
    list_display = ('question_text', 'pub_date', 'was_published_recently')
    # Adds a filter onto the admin site for pub_date
    list_filter = ['pub_date']
    # Adds a searchbox to Admin
    search_fields = ['question_text']


admin.site.register(Question, QuestionAdmin)
