@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "%~s0", "%params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

setlocal
set DRIVE=C:

set CLIENT_MANAGEMENT_SERVER_DIR=%DRIVE%\ClientManagementServer
set PYTHON_DIR=%DRIVE%\Python27\
set RUBY_DIR=%DRIVE%\RailsInstaller\Ruby1.9.3
set RUBY_BIN_DIR=%RUBY_DIR%\bin

set STARTING_DIR=%~p0

%PYTHON_DIR%\python.exe %CLIENT_MANAGEMENT_SERVER_DIR%\client_management_service.py stop

xcopy /s %~p0\ClientManagementServer %CLIENT_MANAGEMENT_SERVER_DIR% 
xcopy /s %~p0\gems %RUBY_DIR%\lib\ruby\gems

cd %CLIENT_MANAGEMENT_SERVER_DIR%
CALL setx RAILS_ENV "production" /M
CALL %RUBY_BIN_DIR%\bundle.bat install
CALL %RUBY_BIN_DIR%\rake.bat db:migrate
CALL %RUBY_BIN_DIR%\rake.bat assets:precompile

%PYTHON_DIR%\python.exe %CLIENT_MANAGEMENT_SERVER_DIR%\client_management_service.py restart
endlocal