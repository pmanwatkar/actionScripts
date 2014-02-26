::arg:string
@echo off
set string=%1
findstr /m "%string%" *.txt > results.txt
if %errorlevel%==0 (
echo Found! logged files into results.txt
) else (
echo No matches found
)