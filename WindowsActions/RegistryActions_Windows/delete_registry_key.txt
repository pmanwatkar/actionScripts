::arguement:key
@echo off
set key=%1%
reg delete %key%

::reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System
