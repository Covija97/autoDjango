@echo off
REM Check Python version
python --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Python is not installed. Please install it before continuing.
    exit /b
)

REM Check pip version
pip --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo pip is not installed. Please install it before continuing.
    exit /b
)

REM Create virtual environment
IF NOT EXIST myworld (
    python -m venv myworld
    echo Virtual environment 'myworld' created.
) ELSE (
    echo The virtual environment 'myworld' already exists.
)

REM Activate virtual environment
call myworld\Scripts\activate.bat

REM Upgrade pip
python -m pip install --upgrade pip

REM Install Django
pip install django

REM Request Django project name
set /p project_name=Enter the name of the new Django project: 

REM Create Django project
django-admin startproject %project_name%

REM Verify project creation
IF EXIST %project_name% (
    echo Django project '%project_name%' created successfully.
) ELSE (
    echo Error creating the Django project.
    exit /b
)

REM Create run script
echo @echo off > run_%project_name%.bat
echo call myworld\Scripts\activate.bat >> run_%project_name%.bat
echo python manage.py runserver >> run_%project_name%.bat
echo Run script 'run_%project_name%.bat' created to start the development server.