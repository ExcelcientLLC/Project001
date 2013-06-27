set DRIVE=C:

set CLIENT_MANAGEMENT_SERVER_DIR=%DRIVE%\ClientManagementServer
set PYTHON_DIR=%DRIVE%\Python27\
set RUBY_DIR=%DRIVE%\RailsInstaller\Ruby1.9.3
set RUBY_BIN_DIR=%RUBY_DIR%\bin

set STARTING_DIR=%~p0
    
%~p0\python-2.7.5.msi
%~p0\pywin32-218.win32-py2.7.exe
%~p0\ImageMagick-6.8.5-8-Q16-x86-static.exe
%~p0\railsinstaller-2.2.1.exe

mkdir %CLIENT_MANAGEMENT_SERVER_DIR%
xcopy /s %~p0\ClientManagementServer %CLIENT_MANAGEMENT_SERVER_DIR% 

echo %STARTING_DIR%

cd %CLIENT_MANAGEMENT_SERVER_DIR%
CALL setx RAILS_ENV "production" /M
CALL %RUBY_BIN_DIR%\bundle.bat install
CALL %RUBY_BIN_DIR%\rake.bat db:migrate

copy %STARTING_DIR%\processor.rb %RUBY_DIR%\lib\ruby\gems\1.9.1\gems\paperclip-3.2.1\lib\paperclip\

%PYTHON_DIR%\python.exe %CLIENT_MANAGEMENT_SERVER_DIR%\client_management_service.py --startup manual install
%PYTHON_DIR%\python.exe %CLIENT_MANAGEMENT_SERVER_DIR%\client_management_service.py restart
pause