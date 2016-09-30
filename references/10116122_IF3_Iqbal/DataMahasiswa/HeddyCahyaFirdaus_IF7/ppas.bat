@echo off
SET THEFILE=d:\datama~1\heddyc~1\yard_k~1.exe
echo Linking %THEFILE%
c:\dev-pas\bin\ldw.exe  D:\DATAMA~1\HEDDYC~1\rsrc.o -s   -b base.$$$ -o d:\datama~1\heddyc~1\yard_k~1.exe link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
