@echo off

IF [%1]==[] call:usage
IF "%1" == "install" call:install
IF "%1" == "reinstall" call:reinstall
IF "%1" == "deps" call:sync

:clean
goto:eof

:reinstall

FOR /D %%i IN (%~dp0\packages\*) DO rd /s /q "%%i"

goto:install

:install    
echo "%~dp0.robin\tools\NuGet\nuget.exe"
call  "%~dp0.robin\tools\NuGet\nuget.exe" install  -outputdirectory lib
goto:eof

:sync
;"%~dp0.robin\tools\NuGet\NuGet.exe" install MSBuild   -outputdirectory packages
"%~dp0packages\MSBuild.0.1.2\tools\Windows\MSBuild.exe" ./.robin/build.proj /target:Sync
goto:eof
:usage
echo cmd:  robin [install,clean]
goto:eof
:eof
