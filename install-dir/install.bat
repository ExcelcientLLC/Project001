set CLIENT_MANAGEMENT_SERVER_DIR="C:\ClientManagementServer"
set PYTHON_DIR="C:\Python27"
set RUBY_BIN_DIR="C:\RailsInstaller\Ruby1.9.3\bin"

%~p0\python-2.7.5.msi
%~p0\pywin32-218.win32-py2.7.exe
%~p0\railsinstaller-2.2.1.exe

mkdir %CLIENT_MANAGEMENT_SERVER_DIR%
xcopy /s %~p0\ClientManagementServer %CLIENT_MANAGEMENT_SERVER_DIR% 

cd %CLIENT_MANAGEMENT_SERVER_DIR%
CALL %RUBY_BIN_DIR%\bundle.bat install
CALL %RUBY_BIN_DIR%\rake.bat db:migrate

%PYTHON_DIR%\python.exe %CLIENT_MANAGEMENT_SERVER_DIR%\client_management_service.py --startup manual install
%PYTHON_DIR%\python.exe %CLIENT_MANAGEMENT_SERVER_DIR%\client_management_service.py start
pause