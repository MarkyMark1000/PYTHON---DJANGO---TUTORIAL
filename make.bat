:: This is the makefile equivalent for windows, but instead it uses make.bat.
:: Run make with no arguments to get the help, then run the appropriate command
:: to execute the desired functionality, eg make venv-run, .....

echo off

if [%1]==[] (

	@echo ""
	@echo "PROJECT HELP:"
	@echo "make               	- this prints out the help for this makefile."
	@echo "Setup:"
	@echo "make venv	    	- this deletes and recreates the venv virtual environment from requirements.txt"
	@echo "make venv-migrations   - DANGER - this makes the migration file and creates/pushes it onto the database."
	@echo "make venv-admin   	- DANGER - this can be used to setup an admin password for the admin site."
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
	@echo "make venv-build-req    - Rebuilds the requirements file from the venv virtual environment."

)

if "%1" EQU "venv" (

	@echo ""
	@echo "Remove the venv virtual environment and then re-create it. using the requirements.txt file."
	@echo ""
	rmdir venv /s
	@echo ""
	virtualenv --no-site-packages -p python venv
	@echo ""
	.\venv\Scripts\activate
	@echo ""
	pip install -r requirements.txt

)

if "%1" EQU "venv-migrations" (

	@echo ""
	@echo "Make migrations file and then push it onto the database"
	@echo ""
	.\venv\Scripts\activate
	@echo ""
	python manage.py makemigrations polls
	@echo ""
	python manage.py migrate

)

if "%1" EQU "venv-admin" (

	@echo ""
	@echo "Setup superuser for admin site."
	@echo ""
	.\venv\Scripts\activate
	@echo ""
	python manage.py createsuperuser

)

if "%1" EQU "venv-run" (

	@echo ""
	@echo "Running application using venv virtual environment."
	@echo ""
	@echo "  Note: the localhost website does not currently produce a useful html website."
	@echo "  You will need to look at links similar to the following:"
	@echo ""
	@echo ""
	@echo "  http://localhost:8000/polls/"
	@echo "  http://localhost:8000/admin/"
	@echo ""
	@echo ""
	.\venv\Scripts\activate
	@echo ""
	python manage.py runserver

)

if "%1" EQU "venv-test" (

	@echo ""
	@echo "Running test in venv virtual environment for the polls app."
	@echo ""
	@echo ""
	.\venv\Scripts\activate
	@echo ""
	python manage.py test polls

)

if "%1" EQU "py-mysite" (

	@echo ""
	@echo "Code standards for mysite directory"
	@echo ""
	@echo ""
	.\venv\Scripts\activate
	@echo ""
	for %%f in (.\mysite\*.py) do pycodestyle %%f

)

if "%1" EQU "pystat-mysite" (

	@echo ""
	@echo "Code standard statistics for mysite directory"
	@echo ""
	@echo ""
	.\venv\Scripts\activate
	@echo ""
	for %%f in (.\mysite\*.py) do pycodestyle --statistics %%f

)

if "%1" EQU "py-polls" (

	@echo ""
	@echo "Code standards for polls directory"
	@echo ""
	@echo ""
	.\venv\Scripts\activate
	@echo ""
	for %%f in (.\polls\*.py) do pycodestyle %%f

)

if "%1" EQU "pystat-polls" (

	@echo ""
	@echo "Code standard statistics for polls directory"
	@echo ""
	@echo ""
	.\venv\Scripts\activate
	@echo ""
	for %%f in (.\polls\*.py) do pycodestyle --statistics %%f

)

if "%1" EQU "venv-clean" (

	@echo ""
	@echo "Remove __pycache__, etc"
	@echo ""
	@echo ""
	rmdir /S mysite\__pycache__
	@echo ""
	rmdir /S polls\__pycache__
	@echo ""
	
)

if "%1" EQU "clean-venv" (

	@echo ""
	@echo "Remove venv virtual environment directory"
	@echo ""
	@echo ""
	rmdir /S venv
	@echo ""
	
)

if "%1" EQU "venv-build-req" (

	@echo ""
	@echo "Rebuild requirements.txt from the venv virutal environment."
	@echo ""
	@echo ""
	del requirements.txt
	@echo ""
	.\venv\Scripts\activate
	@echo ""
	pip freeze > requirements.txt
	
)