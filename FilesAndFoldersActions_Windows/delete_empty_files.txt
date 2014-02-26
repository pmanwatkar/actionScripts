::arg:filename
@echo off
set filename=%1
for /F %%A in ("%filename%") do If %%~zA equ 0 del %filename%

