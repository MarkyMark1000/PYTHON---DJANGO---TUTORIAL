Tutorial Part 1:

  Add polls view.   Then add response into polls/views.py.   Add polls/urls.py and then adjust
  mysite/urls.py so the new project is visible.

  To run the server:
  python manage.py runserver

  To view the polls, go to:
  http://localhost:8000/polls/

Tutorial Part 2:

  We created some models and migrated those onto the database.

  We used the command line shell tool to add questions into the database and choices.

  We ensured the questions were visible in the admin site and could be changed.

  Key sites are:
    http://localhost:8000/polls/
    http://localhost:8000/admin/

  KEY POINT: From this point onwards, if the database doesn't exists, I may need to migrate the models to set everything up.   This may be relevant for testing on windows and linux etc.