
echo %~p0

REM set CLIENT_MANAGEMENT_SERVER_DIR="C:\ClientManagementServer"
set CLIENT_MANAGEMENT_SERVER_DIR="C:\dev\Excelcient\Prosperion"
set PYTHON_DIR="C:\Python27"

%~p0\python-2.7.msi
%~p0\rubyinstaller-1.9.2-p290.exe

xcopy %~p0\Prosperion %CLIENT_MANAGEMENT_SERVER_DIR% /E

%PYTHON_DIR%\python.exe %CLIENT_MANAGEMENT_SERVER_DIR%\client_management_service.py --startup auto install
%PYTHON_DIR%\python.exe %CLIENT_MANAGEMENT_SERVER_DIR%\client_management_service.py start
pause