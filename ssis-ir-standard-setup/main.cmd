@echo off

REM Azure.Storage.Blobs.dll

xcopy /F /Y Azure.Storage.Blobs.dll "%ProgramFiles%\Microsoft SQL Server\140\DTS\Tasks"
REM error handling
if %ERRORLEVEL% neq 0 ( 
echo Failed with ExitCode %ERRORLEVEL%
exit /b %ERRORLEVEL%)
echo "Complete copied to x64 folder"

xcopy /F /Y Azure.Storage.Blobs.dll "%ProgramFiles(x86)%\Microsoft SQL Server\140\DTS\Tasks"
REM error handling
if %ERRORLEVEL% neq 0 ( 
echo Failed with ExitCode %ERRORLEVEL%
exit /b %ERRORLEVEL%)
echo "Complete copied to x86 folder"

gacutil\gacutil /i Azure.Storage.Blobs.dll /f
REM error handling
if %ERRORLEVEL% neq 0 ( 
echo Failed with ExitCode %ERRORLEVEL%
exit /b %ERRORLEVEL%)
echo "Successfully installed Azure.Storage.Blobs.dll"

REM Azure.Storage.Blobs.dll

xcopy /F /Y Azure.Storage.Common.dll "%ProgramFiles%\Microsoft SQL Server\140\DTS\Tasks"
REM error handling
if %ERRORLEVEL% neq 0 ( 
echo Failed with ExitCode %ERRORLEVEL%
exit /b %ERRORLEVEL%)
echo "Complete copied to x64 folder"

xcopy /F /Y Azure.Storage.Common.dll "%ProgramFiles(x86)%\Microsoft SQL Server\140\DTS\Tasks"
REM error handling
if %ERRORLEVEL% neq 0 ( 
echo Failed with ExitCode %ERRORLEVEL%
exit /b %ERRORLEVEL%)
echo "Complete copied to x86 folder"

gacutil\gacutil /i Azure.Storage.Common.dll /f
REM error handling
if %ERRORLEVEL% neq 0 ( 
echo Failed with ExitCode %ERRORLEVEL%
exit /b %ERRORLEVEL%)
echo "Successfully installed Azure.Storage.Common.dll"

REM ODBC 17...TBD