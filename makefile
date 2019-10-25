#Add any comments on this here

#Ensure the script is run as bash
SHELL:=/bin/bash

#Set help as the default for this makefile.
.DEFAULT: help

.PHONY: help

help:
	@echo ""
	@echo "PROJECT HELP:"
	@echo "make               	- this prints out the help for this makefile."
	@echo "make help          	- this prints out the help for this makefile."
	@echo "Setup:"
	@echo "make venv	    	- this deletes and recreates the venv virtual environment from requirements.txt"
	@echo "make venv-migrations   	- DANGER - this makes the migration file and creates/pushes it onto the database."
	@echo "make venv-admin   	- DANGER - this can be used to setup an admin password for the admin site."
	@echo "make venv-docs	    	- this deletes and recreates the html file in the docs directory using the index.rst file"
	@echo "Run:"
	@echo "make venv-run      	- runs the script in the venv virtual environment."
	@echo "Testing:"
	@echo "make venv-test   	- Run the Test in the virtual environment."
	@echo "Code Standard:"
	@echo "make py-mysite   	- Code standard for mysite directory."
	@echo "make pystat-mysite   	- Code standard statistics for mysite directory."
	@echo "make py-polls   	- Code standard for polls directory."
	@echo "make pystat-polls   	- Code standard statistics for polls directory."
	@echo "Clean:"
	@echo "make venv-clean    	- Remove __pycache__ etc"
	@echo "make clean-venv    	- Remove venv virtual environment."
	@echo "Distribution:"
	@echo "make venv-build-req    	- Rebuilds the requirements file from the venv virtual environment."

venv:
	@echo ""
	@echo "Remove the venv virtual environment and then re-create it. using the requirements.txt file."
	@echo ""
	rm -rf venv
	@echo ""
	virtualenv --no-site-packages -p python3 venv
	@echo ""
	( source venv/bin/activate; pip install -r requirements.txt; )

venv-migrations:
	@echo ""
	@echo "Make migrations file and then push it onto the database"
	@echo ""
	( source venv/bin/activate; python manage.py makemigrations polls; python manage.py migrate; )
	@echo ""

venv-admin:
	@echo ""
	@echo "Setup superuser for admin site."
	@echo ""
	( source venv/bin/activate; python manage.py createsuperuser; )
	@echo ""

venv-docs:
	@echo ""
	@echo "Remove the documents and then recreate it using index.rst"
	@echo ""
	@echo ""
	rm -rf ./docs/*.html
	@echo ""
	rst2html.py ./docs/index.rst ./docs/index.html
	@echo ""

venv-run:
	@echo ""
	@echo "Running application using venv virtual environment."
	@echo ""
	@echo ""
	@echo "  Note: the localhost website does not currently produce a useful html website."
	@echo "  You will need to look at links similar to the following:"
	@echo ""
	@echo "  http://localhost:8000/polls/"
	@echo "  http://localhost:8000/admin/"
	@echo ""
	@echo ""
	( source venv/bin/activate; python manage.py runserver; )
	@echo ""

venv-test:
	@echo ""
	@echo "Running test in venv virtual environment for the polls app."
	@echo ""
	( source venv/bin/activate; python manage.py test polls; )
	@echo ""

py-mysite:
	@echo ""
	@echo "Code standards for mysite directory"
	@echo ""
	( source venv/bin/activate; pycodestyle ./mysite/*.py;)
	@echo ""

pystat-mysite:
	@echo ""
	@echo "Code standard statistics for mysite directory"
	@echo ""
	( source venv/bin/activate; pycodestyle --statistics ./mysite/*.py;)
	@echo ""

py-polls:
	@echo ""
	@echo "Code standards for polls directory"
	@echo ""
	( source venv/bin/activate; pycodestyle ./polls/*.py;)
	@echo ""

pystat-polls:
	@echo ""
	@echo "Code standard statistics for polls directory"
	@echo ""
	( source venv/bin/activate; pycodestyle --statistics ./polls/*.py;)
	@echo ""

venv-clean:
	@echo ""
	@echo "Remove __pycache__, etc"
	@echo ""
	rm -rf ./mysite/__pycache__*
	@echo ""
	@echo ""
	rm -rf ./polls/__pycache__*
	@echo ""

clean-venv:
	@echo ""
	@echo "Remove venv virtual environment directory"
	@echo ""
	rm -rf venv
	@echo ""

venv-build-req:
	@echo ""
	@echo "Rebuild requirements.txt from the venv virutal environment."
	@echo ""
	rm -rf requirements.txt
	@echo ""
	( source venv/bin/activate; pip freeze > requirements.txt; )
	@echo ""
