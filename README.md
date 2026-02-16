[Español](readme_es.md)

# autoDjango

> **Batch file** that automates the creation and setup of Django projects, including virtual environments, project initialization, and utility scripts.

## [createdjango.bat](/src/createdjango.bat)

### **Usage**

1. Download the file [createdjango.bat](/src/createdjango.bat).
2. Place it in the directory where you want to create your Django project.
3. Double-click on `createdjango.bat` and follow the prompts.

### **Features**

The `createdjango.bat` script performs the following tasks:

1. **Check Python version**: Ensures Python is installed on the system.
2. **Check pip version**: Verifies that pip is available.
3. **Create virtual environment**: Prompts for a virtual environment name and creates it if it doesn't exist.
4. **Activate virtual environment**: Activates the virtual environment.
5. **Upgrade pip**: Updates pip to the latest version.
6. **Install Django**: Installs Django in the virtual environment.
7. **Request Django project name**: Ensures the project name is valid and not already in use.
8. **Create Django project**: Initializes a new Django project using `django-admin`.
9. **Verify project creation**: Confirms the project was created successfully.
10. **Generate utility scripts**:
    - **Module installation script**: Creates `CD_install_modules.bat` to install additional Python modules.
    - **Run server script**: Creates `CD_run_<project_name>.bat` to start the Django development server.
    - **Application creation script**: Creates `CD_create_apps.bat` to add new Django applications to the project.

### **Generated Scripts**

- **`CD_install_modules.bat`**: Allows you to install additional Python modules and reminds you to add them to `INSTALLED_APPS` in your Django settings.
- **`CD_run_<project_name>.bat`**: Activates the virtual environment and starts the Django development server.
- **`CD_create_apps.bat`**: Automates the creation of new Django applications within the project.

This script simplifies the setup process for Django projects, ensuring all necessary components are configured correctly.
