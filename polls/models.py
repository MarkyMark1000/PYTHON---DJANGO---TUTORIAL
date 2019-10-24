import datetime
from django.db import models
from django.utils import timezone

# MJW:
# These classes were added to represent he core model of the Django project.   It is a class
# representation of the database structure.

class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')

    # MJW: Added so we could see the string representation of the model
    def __str__(self):
        return self.question_text
    
    def was_published_recently(self):
        now = timezone.now()
        return now - datetime.timedelta(days=1) <= self.pub_date <= now

    # MJW: These were added to ensure column sorting in the admin section worked.
    was_published_recently.admin_order_field = 'pub_date'
    was_published_recently.boolean = True
    was_published_recently.short_description = 'Published recently?'

class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)

    # MJW: Added so we could see the string representation of the model
    def __str__(self):
        return self.choice_text