[español](readme_es.md)

# autoDjango

> **Batch file** that automatically generates the structure described in [w3school](https://www.w3schools.com/django/) to create Django projects

## [createdjango.bat](/src/createdjango.bat)

### **Usage**

1. Download the file [createdjango.bat](/src/createdjango.bat).
2. Place it in the root directory of your Django project.
3. Double-click on `createdjango.bat`.

### **Structure**

The `createdjango.bat` script automates the setup of a Django project environment. It performs the following tasks:

1. **Check Python version**: Verifies if Python is installed on the system.
2. **Check pip version**: Ensures that pip, the Python package installer, is available.
3. **Create virtual environment**: Checks if a virtual environment named `myworld` exists. If not, creates one.
4. **Activate virtual environment**: Activates the `myworld` virtual environment.
5. **Upgrade pip**: Upgrades pip to the latest version within the virtual environment.
6. **Install Django**: Installs Django using pip.
7. **Request Django project name**: Prompts the user to enter a name for the new Django project.
8. **Create Django project**: Uses `django-admin` to create a new Django project with the specified name.
9. **Verify project creation**: Checks if the project was created successfully and provides feedback
10. **Install Bootstrap 5**: Optionally installs Bootstrap 5 using `django-bootstrap-v5`.
11. **Create run script**: Generates a batch file to easily start the Django development server for the new project.

This script simplifies the initial setup process for Django projects, ensuring that all necessary components are installed and configured correctly.