@echo off
::arg:filename
:START
REM Execute the MS-DOS dir command ever 20 seconds.
dir
ping 123.45.67.89 -n 1 -w 2000 > nul
::SLEEP 20
GOTO START

