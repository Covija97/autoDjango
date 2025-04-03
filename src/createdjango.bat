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

REM Request virtual environment name
set /p venv_name=-- Enter the name of the virtual environment:

REM Create virtual environment
echo.
echo ---- Creating virtual environment...
echo.
IF NOT EXIST %venv_name% (
    python -m venv %venv_name%
    echo ---- Virtual environment '%venv_name%' created.
    echo.
) ELSE (
    echo ---- The virtual environment '%venv_name%' already exists.
    echo.
)

REM Activate virtual environment
echo -- Activating virtual environment...
echo.
call %venv_name%\Scripts\activate.bat

REM Upgrade pip
echo -- Upgrading pip...
echo.
python -m pip install --upgrade pip

REM Install Django
echo.
echo -- Installing Django...
echo.
pip install django
echo.

REM Request Django project name
set invalid_names=django %venv_name% Django /

:request_project_name
set /p project_name=-- Enter the name of the new Django project:

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
echo.
IF EXIST %project_name% (
    echo ---- Project with the same name already exists.
    echo.
    goto create_run_script
) ELSE (
    echo ---- Creating Django project...
    echo.
    django-admin startproject %project_name%
)

REM Verify project creation
IF EXIST %project_name% (
    echo ---- Django project '%project_name%' created successfully.
    echo.
) ELSE (
    echo ---- Error creating the Django project.
    pause
    exit /b
)

REM Create instalated modules script
echo -- Creating script to install required modules...
echo.
echo @echo off                                                  > CD_install_modules.bat
echo call %venv_name%\Scripts\activate.bat                      >> CD_install_modules.bat
echo set /p module=-- Enter the name of the module to install:  >> CD_install_modules.bat
echo echo.                                                      >> CD_install_modules.bat
echo echo -- Installing %%module%% module...                    >> CD_install_modules.bat
echo echo.                                                      >> CD_install_modules.bat
echo pip install %%module%%                                     >> CD_install_modules.bat
echo echo.                                                      >> CD_install_modules.bat
echo echo -- %%module%% module installed.                       >> CD_install_modules.bat
echo echo -- Add the module %%module%% in your file '%project_name%/settings.py/INSTALLED_APPS' >> CD_install_modules.bat
echo echo.                                                      >> CD_install_modules.bat
echo pause                                                      >> CD_install_modules.bat   
echo ---- Run script 'CD_install_modules.bat' created successfully.
echo.


REM Create run script
echo -- Creating run script...
echo.
echo @echo off                                  > CD_run_%project_name%.bat
echo title Run server - %project_name%          >> CD_run_%project_name%.bat
echo call %venv_name%\Scripts\activate.bat      >> CD_run_%project_name%.bat
echo python %project_name%\manage.py runserver  >> CD_run_%project_name%.bat
echo pause                                      >> CD_run_%project_name%.bat
echo ---- Run script 'CD_run_%project_name%.bat' created successfully.
echo.

REM Create aplications script
echo -- Creating applications script...
echo.
echo @echo off                                                  > CD_create_apps.bat
echo title Create application - %project_name%                  >> CD_create_apps.bat
echo cd %project_name%                                          >> >> CD_create_apps.bat
echo :start                                                     >> >> CD_create_apps.bat
echo set /p app_name=-- Enter the name of the new application:  >> >> CD_create_apps.bat
echo echo.                                                      >> >> CD_create_apps.bat   
echo if %%app_name%%=="" (                                      >> >> CD_create_apps.bat
echo     echo ---- Application name cannot be empty.            >> >> CD_create_apps.bat
echo     echo.                                                  >> >> CD_create_apps.bat   
echo     goto start                                             >> >> CD_create_apps.bat
echo )                                                          >> >> CD_create_apps.bat
echo if exist %%app_name%% (                                    >> >> CD_create_apps.bat
echo     echo ---- Application with the same name already exists.>> >> CD_create_apps.bat
echo     echo.                                                  >> >> CD_create_apps.bat   
echo     goto start                                             >> >> CD_create_apps.bat
echo )                                                          >> >> CD_create_apps.bat
echo python manage.py startapp %%app_name%%                     >> >> CD_create_apps.bat
echo REM Checking if the application was created successfully   >> >> CD_create_apps.bat
echo IF EXIST %%app_name%% (                                    >> >> CD_create_apps.bat
echo     echo ---- Application '%%app_name%%' created successfully.>> >> CD_create_apps.bat
echo     echo.                                                  >> >> CD_create_apps.bat   
echo ) ELSE (                                                   >> >> CD_create_apps.bat
echo     echo ---- Error creating the application.              >> >> CD_create_apps.bat
echo     echo.                                                  >> >> CD_create_apps.bat   
echo )                                                          >> >> CD_create_apps.bat
echo set /p app_name=-- You want to create another application? (y/n):>> >> CD_create_apps.bat
echo echo.                                                      >> >> CD_create_apps.bat
echo if /i "%%app_name%%"=="y" (                                >> >> CD_create_apps.bat
echo     goto start                                             >> >> CD_create_apps.bat
echo ) ELSE (                                                   >> >> CD_create_apps.bat
echo     echo ---- Applications script finished.                >> >> CD_create_apps.bat
echo     exit /b                                                >> >> CD_create_apps.bat
echo )                                                          >> >> CD_create_apps.bat

echo ---- Applications script '>> CD_create_apps.bat' created successfully.
echo.

REM Finish
echo -- Django project setup completed successfully.
echo.
pause