set CLIENT_MANAGEMENT_SERVER_DIR="C:\ClientManagementServer"
set PYTHON_DIR="C:\Python27"
set RUBY_BIN_DIR="C:\Ruby193\bin"

%~p0\python-2.7.msi
%~p0\rubyinstaller-1.9.2-p290.exe

mkdir %CLIENT_MANAGEMENT_SERVER_DIR%
xcopy /s %~p0\ClientManagementServer %CLIENT_MANAGEMENT_SERVER_DIR% 

REM cd %CLIENT_MANAGEMENT_SERVER_DIR%
REM START /B %RUBY_BIN_DIR%\bundle.bat install
REM %RUBY_BIN_DIR%\rake.bat db:migrate

%PYTHON_DIR%\python.exe %CLIENT_MANAGEMENT_SERVER_DIR%\client_management_service.py --startup auto install
%PYTHON_DIR%\python.exe %CLIENT_MANAGEMENT_SERVER_DIR%\client_management_service.py start
pause