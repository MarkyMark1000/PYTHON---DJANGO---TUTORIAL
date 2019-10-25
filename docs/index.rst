===============
DJANGO TUTORIAL
===============

Overview
========

Tutorial
--------

This project is based upon the Django tutorial in the following location:

   https://docs.djangoproject.com/en/2.2/intro/tutorial01/

The tutorial is pretty limited, but a good introduction into building Django Apps, the
admin site and using the shell to analyse the model characteristics.

Warning:
--------

In a similar manner to Flask, there is a default value for SECRET_KEY should be changed to some 
random bytes in production.

    python -c 'import os; print(os.urandom(16))'

    b'_5#y2L"F4Q8z\n\xec]/'


Installation Guide
==================

Manual Installation
-------------------

- If it exists, remove the venv virtual environment directory using the following:
    - ``rm -rf venv      (mac)``
    - ``rmdir venv /s    (windows)``
- Recreate the virtual environment directory using the following:
    - Mac:
        - ``virtualenv --no-site-packages -p python3 venv``
        - ``deactivate or source deactivate``
        - ``source venv/bin/activate``
        - ``pip install -r requirements.txt``
    - Windows:
        - ``virtualenv --no-site-packages -p python venv``
        - ``deactivate or source deactivate``
        - ``.\venv\Scripts\activate``
        - ``pip install -r requirements.txt``
- Make model migrations:
    - Mac:
        - ``deactivate or source deactivate``
        - ``source venv/bin/activate``
        - ``python manage.py makemigrations polls``
        - ``python manage.py check``
        - ``python manage.py migrate``
    - Windows:
        - ``deactivate or source deactivate``
        - ``.\venv\Scripts\activate``
        - ``python manage.py makemigrations polls``
        - ``python manage.py check``
        - ``python manage.py migrate``
- You can setup a superuser account for the admin part of the Django polls app using the following:
    - Mac:
        - ``deactivate or source deactivate``
        - ``source venv/bin/activate``
        - ``python manage.py createsuperuser``
    - Windows:
        - ``deactivate or source deactivate``
        - ``.\venv\Scripts\activate``
        - ``python manage.py createsuperuser``
- If necessary, the html document in the docs directory can be rebuilt using:
    - Mac:
        - ``rm -rf ./docs/*.html``
        - ``rst2html ./docs/index.rst ./docs/index.html``
    - Windows:
        - ``del .\docs\*.html``
        - ``rst2html.py .\docs\index.rst .\docs\index.html``


MakeFile Installation (Mac, Linux or Unix)
------------------------------------------   
This project was written and tested on a mac and it has not been tested on Linux.

- To get help:
    - Run 'make' or 'make help' to get help on this project.
- It is sensible to reset the virtual environment so that it reflects the current requirements.txt file:
    - Run 'make venv' to build the virtual environment from requirements.txt.
- The first time that this project is installed, or when model changes are made:
    - Run 'make venv-migrations' to migrate models.
- To create a superuser for the admin site:
    - Run 'make venv-admin'
- There isn't much supporting documentation, but it can be rebuilt using the following:
    - Run 'make venv-docs' to build /docs/index.html

    
Running the Application
=======================

Manual
------

- To run the app using the normal environment:
    - Mac:
        - ``deactivate or source deactivate``
        - ``source venv/bin/activate``
        - ``python manage.py runserver``
    - Windows:
        - ``deactivate or source deactivate``
        - ``.\venv\Scripts\activate``
        - ``python manage.py runserver``
    - Please note that the standard localhost is not a valid website that produces html.   You will need to use:
        - ``http://localhost/polls/``
        - ``http://localhost/admin/``

MakeFile
--------

- To run the Django site:
    - Run 'make venv-run'

Testing the Application
=======================

Manual
------

- Depending upon if new packages have been installed and if you wish to keep them in the project, it may be worth rebuilding the virtual environment and requirements.txt file to ensure they are consistent:
    - To throw away any new packages and recreate the venv virtual environment from the requirements.txt file:
        - Mac:
            - ``rm -rf venv``
            - ``virtualenv --no-site-packages -p python3 venv``
            - ``deactivate or source deactivate``
            - ``source venv/bin/activate``
            - ``pip install -r requirements.txt``
        - Windows:
            - ``rmdir venv /s``
            - ``virtualenv --no-site-packages -p python venv``
            - ``deactivate or source deactivate``
            - ``.\venv\Scripts\activate``
            - ``pip install -r requirements.txt``
    - To recreate the requirements.txt file from the current venv virtual environment:
        - Mac:
            - ``rm -rf requirements.txt``
            - ``deactivate or source deactivate``
            - ``source venv/bin/activate``
            - ``pip freeze > requirements.txt``
        - Windows:
            - ``del requirements.txt``
            - ``deactivate or source deactivate``
            - ``.\venv\Scripts\activate``
            - ``pip freeze > requirements.txt``

- To run a basic test:
    - Mac:
        - ``deactivate or source deactivate``
        - ``source venv/bin/activate``
        - ``python manage.py test polls``
    - Windows:
        - ``deactivate or source deactivate``
        - ``.\venv\Scripts\activate``
        - ``python manage.py test polls``

MakeFile
--------

- Depending upon if new packages have been installed and if you wish to keep them in the project, it may be worth rebuilding the virtual environment and requirements.txt file to ensure they are consistent:
    - To throw away any new packages and recreate the venv virtual environment from the requirements.txt file:
        - Run 'make venv' to build a new venv environment from existing requirements.txt file.
    - To recreate the requirements.txt file from the current venv virtual environment:
        - Run 'make venv-build-req' to build a new requirements.txt file from existing venv environment.

- To run a basic test:
    - Run 'make venv-test' to run test in venv virtual environment.

Test Coding Standards
=====================

Manual
------

- Test the code within the mysite directory:
    - Mac:
        - ``deactivate or source deactivate``
        - ``source venv/bin/activate``
        - ``pycodestyle --statistics ./mysite/*.py``
    - Windows:
        - ``deactivate or source deactivate``
        - ``.\venv\Scripts\activate``
        - ``pycodestyle --statistics filename.py``
- Test the code within the polls directory:
    - Mac:
        - ``deactivate or source deactivate``
        - ``source venv/bin/activate``
        - ``pycodestyle --statistics ./polls/*.py``
    - Windows:
        - ``deactivate or source deactivate``
        - ``.\venv\Scripts\activate``
        - ``pycodestyle --statistics filename.py``

MakeFile
--------

- Test the code within the flaskr directory:
    - Run 'make pystat-mysite'

- Test the code within the tests directory:
    - Run 'make pystat-polls'

Cleanup
=======

Manual
------

- The flaskr app can become cluttered with a number of directories and files.   The following can be used to clean them up:
    - Mac:
        - ``rm -rf ./mysite/__pycache__*``
        - ``rm -rf ./polls/__pycache__*``
    - Windows:
        - ``rmdir /S mysite\__pycache__``
        - ``rmdir /S polls\__pycache__``

- If you wish to remove the venv virtual environment directory:
    - ``rm -rf venv``
    - ``rmdir /S venv``

MakeFile
--------

- To clean files such as pytest_cache, dist etc:
    - Run 'make venv-clean'

- If you wish to remove the venv virtual environment directory:
    - Run 'make clean-venv'

Distribution
============

