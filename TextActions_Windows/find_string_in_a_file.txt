::arg:filename
@echo off
set string=%1
set filename=%2
findstr /m "%string%" %filename%
if %errorlevel%==0 (
echo There is hope!
)