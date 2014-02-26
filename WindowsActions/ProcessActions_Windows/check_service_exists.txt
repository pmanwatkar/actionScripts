@echo off
set service_name=%1%
net start | find %service_name%
if ERRORLEVEL 1 net stop %service_name%
net start %service_name%
