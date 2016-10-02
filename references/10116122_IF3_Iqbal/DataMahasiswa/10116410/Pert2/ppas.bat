@echo off
SET THEFILE=d:\datama~1\10116410\pert2\projec~2.exe
echo Linking %THEFILE%
c:\dev-pas\bin\ldw.exe  D:\DATAMA~1\10116410\Pert2\rsrc.o -s   -b base.$$$ -o d:\datama~1\10116410\pert2\projec~2.exe link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
