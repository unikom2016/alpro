@echo off
SET THEFILE=d:\datama~1\101160~1\101160~1\menu_p~1.exe
echo Linking %THEFILE%
c:\dev-pas\bin\ldw.exe  D:\DATAMA~1\101160~1\101160~1\rsrc.o -s   -b base.$$$ -o d:\datama~1\101160~1\101160~1\menu_p~1.exe link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
