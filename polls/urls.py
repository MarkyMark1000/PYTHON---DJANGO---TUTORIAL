from django.urls import path

from . import views


# MJW:
# This is important, it allows the use of namespaces, and hence the use
# of 'polls:detail' in the templates directory.
app_name = 'polls'

# MJW:
# We use generic views in the views.py.   This is where the class inherits
# from something like generic.listview or generic.detailview.
# The generic views are listed differently here in a form such as:
# <int:pk> ... views.IndexView.as_view(), views.DetailView.as_view(), ...
# Note the use of pk instead of the input.   This is the primary key of
# the database.   views.vote would be the traditional way.
urlpatterns = [
    # ex: /polls/
    path('', views.IndexView.as_view(), name='index'),
    # ex: /polls/5/
    path('<int:pk>/', views.DetailView.as_view(), name='detail'),
    # ex: /polls/5/results/
    path('<int:pk>/results/', views.ResultsView.as_view(), name='results'),
    # ex: /polls/5/vote/
    path('<int:question_id>/vote/', views.vote, name='vote'),
]
