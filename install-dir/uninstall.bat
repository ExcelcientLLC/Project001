@echo off

set DRIVE=C:

set CLIENT_MANAGEMENT_SERVER_DIR=%DRIVE%\ClientManagementServer
set PYTHON_DIR=%DRIVE%\Python27\

%PYTHON_DIR%\python.exe %CLIENT_MANAGEMENT_SERVER_DIR%\client_management_service.py stop
%PYTHON_DIR%\python.exe %CLIENT_MANAGEMENT_SERVER_DIR%\client_management_service.py remove

cd  %DRIVE%
CALL rmdir %CLIENT_MANAGEMENT_SERVER_DIR% /s
pause