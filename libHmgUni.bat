@echo off

echo step 1
set previouspath=%path%
set path=c:\bcd\prg\comp\mgw102\bin;c:\bcd\prg\pcomp\hb32_mgw102\bin;%path%
:: set HMGPATH=%~dp0
:: set PATH=%HMGPATH%\harbour\bin;%HMGPATH%\mingw\bin;%PATH%

echo.
echo. Building HMG Library Unicode 32b
echo.
echo step 2
if not exist "INCLUDE\_UNICODE.ch" ( goto ERROR2 )
copy INCLUDE\_UNICODE.ch  INCLUDE\SET_COMPILE_HMG_UNICODE.ch > nul
if %ERRORLEVEL% NEQ 0 goto ERROR2
goto BUILDLIB


:ERROR2
echo step 3
echo. ERROR: file (INCLUDE\_UNICODE.ch) not exist or failed copy
exit


:BUILDLIB
echo step 4
hbmk2 hmg32.hbp
set path=%previouspath%