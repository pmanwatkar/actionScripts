@echo off
set location=%1
for /d %%X in (%location%\*) do echo %%X
