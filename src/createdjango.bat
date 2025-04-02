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
echo @echo off                                                  > install_modules.bat
echo call %venv_name%\Scripts\activate.bat                      >> install_modules.bat
echo set /p module=-- Enter the name of the module to install:  >> install_modules.bat
echo.                                                           >> install_modules.bat
echo -- Installing %module% module...                           >> install_modules.bat
echo pip install %module%                                       >> install_modules.bat
echo.                                                           >> install_modules.bat
echo -- %module% module installed.                              >> install_modules.bat

REM Create run script
echo -- Creating run script...
echo.
echo @echo off                                  > run_%project_name%.bat
echo title Run server - %project_name%          >> run_%project_name%.bat
echo call %venv_name%\Scripts\activate.bat      >> run_%project_name%.bat
echo python %project_name%\manage.py runserver  >> run_%project_name%.bat
echo pause                                      >> run_%project_name%.bat
echo ---- Run script 'run_%project_name%.bat' created successfully.
echo.

REM Create aplications script
echo -- Creating applications script...
echo.
echo @echo off                                                  > apps_%project_name%.bat
echo title Create application - %project_name%                  >> apps_%project_name%.bat
echo cd %project_name%                                          >> apps_%project_name%.bat
echo :start                                                     >> apps_%project_name%.bat
echo set /p app_name=-- Enter the name of the new application:  >> apps_%project_name%.bat
echo echo.                                                      >> apps_%project_name%.bat   
echo if %%app_name%%=="" (                                      >> apps_%project_name%.bat
echo     echo ---- Application name cannot be empty.            >> apps_%project_name%.bat
echo     echo.                                                  >> apps_%project_name%.bat   
echo     goto start                                             >> apps_%project_name%.bat
echo )                                                          >> apps_%project_name%.bat
echo if exist %%app_name%% (                                    >> apps_%project_name%.bat
echo     echo ---- Application with the same name already exists.>> apps_%project_name%.bat
echo     echo.                                                  >> apps_%project_name%.bat   
echo     goto start                                             >> apps_%project_name%.bat
echo )                                                          >> apps_%project_name%.bat
echo python manage.py startapp %%app_name%%                     >> apps_%project_name%.bat
echo REM Checking if the application was created successfully   >> apps_%project_name%.bat
echo IF EXIST %%app_name%% (                                    >> apps_%project_name%.bat
echo     echo ---- Application '%%app_name%%' created successfully.>> apps_%project_name%.bat
echo     echo.                                                  >> apps_%project_name%.bat   
echo ) ELSE (                                                   >> apps_%project_name%.bat
echo     echo ---- Error creating the application.              >> apps_%project_name%.bat
echo     echo.                                                  >> apps_%project_name%.bat   
echo )                                                          >> apps_%project_name%.bat
echo set /p app_name=-- You want to create another application? (y/n):>> apps_%project_name%.bat
echo echo.                                                      >> apps_%project_name%.bat
echo if /i "%%app_name%%"=="y" (                                >> apps_%project_name%.bat
echo     goto start                                             >> apps_%project_name%.bat
echo ) ELSE (                                                   >> apps_%project_name%.bat
echo     echo ---- Applications script finished.                >> apps_%project_name%.bat
echo     exit /b                                                >> apps_%project_name%.bat
echo )                                                          >> apps_%project_name%.bat

echo ---- Applications script 'apps_%project_name%.bat' created successfully.
echo.

REM Finish
echo -- Django project setup completed successfully.
echo.
pause