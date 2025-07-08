@echo off
echo Welcome in DriverInstaller.
echo Please insert Driver ROM (.drvrom file) into the User Folder and press [ENTER].
pause>nul
cd ..\..\..\..\..\..\..\..\..\..\..\..\..\..
cd .\sysroot\usr\%username%\
dir *.drvrom
set /p "exec=Select a driver (only name) > "
cd ..\..\..\..\..\..\..\..\..\..\..\..\..\..
copy .\sysroot\usr\%username%\%exec%.drvrom .\xcuts\drvins\drivers
rename .\xcuts\drvins\drivers\%exec%.drvrom %exec%.bat
mkdir .\xcuts\codecs\%exec%
copy .\xcuts\drvins\driver\%exec%.bat .\xcuts\codecs\%exec%\
echo Done!
pause
cd ..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..
.\sedos.cmd