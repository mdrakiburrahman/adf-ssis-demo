@echo off

REM Azure.Storage.Blobs.dll

xcopy /F /Y Microsoft.WindowsAzure.Storage.dll "%ProgramFiles%\Microsoft SQL Server\140\DTS\Tasks"
REM error handling
if %ERRORLEVEL% neq 0 ( 
echo Failed with ExitCode %ERRORLEVEL%
exit /b %ERRORLEVEL%)
echo "Complete copied to x64 folder"

xcopy /F /Y Microsoft.WindowsAzure.Storage.dll "%ProgramFiles(x86)%\Microsoft SQL Server\140\DTS\Tasks"
REM error handling
if %ERRORLEVEL% neq 0 ( 
echo Failed with ExitCode %ERRORLEVEL%
exit /b %ERRORLEVEL%)
echo "Complete copied to x86 folder"

gacutil\gacutil /i Microsoft.WindowsAzure.Storage.dll /f
REM error handling
if %ERRORLEVEL% neq 0 ( 
echo Failed with ExitCode %ERRORLEVEL%
exit /b %ERRORLEVEL%)
echo "Successfully installed Microsoft.WindowsAzure.Storage.dll"

REM ODBC 17...TBD