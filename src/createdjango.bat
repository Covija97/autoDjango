@echo off
REM Verificar versión de Python
python --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Python no está instalado. Por favor, instálalo antes de continuar.
    exit /b
)

REM Verificar versión de pip
pip --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo pip no está instalado. Por favor, instálalo antes de continuar.
    exit /b
)

REM Crear entorno virtual
IF NOT EXIST myworld (
    python -m venv myworld
    echo Entorno virtual 'myworld' creado.
) ELSE (
    echo El entorno virtual 'myworld' ya existe.
)

REM Activar entorno virtual
call myworld\Scripts\activate.bat

REM Actualizar pip
python -m pip install --upgrade pip

REM Instalar Django
pip install django

REM Solicitar nombre del proyecto Django
set /p project_name=Introduce el nombre del nuevo proyecto Django: 

REM Crear proyecto Django
django-admin startproject %project_name%

REM Verificar creación del proyecto
IF EXIST %project_name% (
    echo Proyecto Django '%project_name%' creado correctamente.
) ELSE (
    echo Error al crear el proyecto Django.
    exit /b
)

REM Crear script de ejecución
echo @echo off > run_%project_name%.bat
echo call myworld\Scripts\activate.bat >> run_%project_name%.bat
echo python manage.py runserver >> run_%project_name%.bat
echo Script de ejecución 'run_%project_name%.bat' creado para iniciar el servidor de desarrollo.