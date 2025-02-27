@echo off

REM Check Python version
echo -- Checking Python version...
echo.
python --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ---- Python is not installed. Please install it before continuing.
    pause
    exit /b
) else (
    echo ---- Python is installed.
    echo.
)

REM Check pip version
echo -- Checking pip version...
echo.
pip --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo ---- pip is not installed. Please install it before continuing.
    pause
    exit /b
) else (
    echo ---- pip is installed.
    echo.
)

REM Create virtual environment
echo -- Creating virtual environment...
echo.
IF NOT EXIST myworld (
    python -m venv myworld
    echo ---- Virtual environment 'myworld' created.
    echo.
) ELSE (
    echo ---- The virtual environment 'myworld' already exists.
    echo.
)

REM Activate virtual environment
echo -- Activating virtual environment...
echo.
call myworld\Scripts\activate.bat

REM Upgrade pip
echo -- Upgrading pip...
echo.
python -m pip install --upgrade pip

REM Install Django
echo.
echo -- Installing Django...
echo.
pip install django

REM Request Django project name
echo.
set invalid_names=django myworld Django /

:request_project_name
set /p project_name=--- Enter the name of the new Django project:
echo.


REM Check if project_name is empty
if "%project_name%"=="" (
    echo ---- Project name cannot be empty.
    echo.
    goto request_project_name
)

REM Check if project_name is in invalid_names
for %%i in (%invalid_names%) do (
    if /i "%%i"=="%project_name%" (
        echo ---- Invalid project name. Please choose a different name.
        echo.
        goto request_project_name
    )
)

REM Create Django project
echo -- Creating Django project...
echo.
django-admin startproject %project_name%

REM Verify project creation
IF EXIST %project_name% (
    echo ---- Django project '%project_name%' created successfully.
    echo.
) ELSE (
    echo ---- Error creating the Django project.
    pause
    exit /b
)

REM Create run script
echo -- Creating run script...
echo.
echo @echo off                                  > run_%project_name%.bat
echo title Run server - %project_name%          >> run_%project_name%.bat
echo call myworld\Scripts\activate.bat          >> run_%project_name%.bat
echo python %project_name%\manage.py runserver  >> run_%project_name%.bat
echo pause                                      >> run_%project_name%.bat
echo ---- Run script 'run_%project_name%.bat' created successfully.
echo.

REM Finish
echo -- Django project setup completed successfully.
echo.
pause