@echo off
title SeDOS Operating System
net start
ping localhost -n 3 >nul
cls
if exist .\sysroot\vlds\skipfilecheck.true goto befsl
if exist .\sysroot\vlds\skipfilecheck.false goto filecheck

:filecheck
if exist .\sysroot\verinf\bootscreen.dat goto bvcheck
if not exist .\sysroot\verinf\bootscreen.dat goto syserr

:bvcheck
if exist .\sysroot\verinf\skipbootscreen.true goto menu
if exist .\sysroot\verinf\skipbootscreen.false goto sysload

:befsl
echo System isn't checking files. Device may be at risk.
goto sysload

:syserr
more .\sysroot\verinf\loaderror.dat
pause
.\sedos.cmd

:sysload
more .\sysroot\verinf\bootscreen.dat
ping localhost -n 5 >nul
set localmenupath=.\sysroot\class\1.cl
set deflogon=.\sysroot\class\4a.cl
if exist .\sysroot\usr\"%username%" goto doslogon
if not exist .\sysroot\usr\"%username%" goto dosreg

:dosreg
cls
more .\sysroot\class\4c.cl
set /p "ps=Password for "%username%" > "
mkdir .\sysroot\usr\"%username%"
echo PassFile>.\sysroot\usr\"%username%"\%ps%.pws
attrib +h +s .\sysroot\usr\"%username%"\%ps%.pws
mkdir .\sysroot\usr\"%username%"\acinfo
echo adminpermfile>.\sysroot\usr\"%username%"\acinfo\IsAdmin.true
attrib +h +s .\sysroot\usr\"%username%"\acinfo\IsAdmin.true
goto menu

:doslogon
cls
echo [Welcome, "%username%"]>.\sysroot\class\4a.cl
more .\sysroot\class\4a.cl
set /p "pw=Password > "
if not exist .\sysroot\usr\"%username%"\%pw%.pws exit
if exist .\sysroot\usr\"%username%"\%pw%.pws goto menu

:menu
cd ..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\
if exist .\sysroot\verinf\skipbootscreen.true rename skipbootscreen.true skipbootscreen.false
cls
echo Logged in as "%username%"
more %localmenupath%
set /p "s=SELECT > "
if %s%==1 goto run
if %s%==2 goto load
if %s%==3 goto spr
if %s%==9 goto options
if %s%==0 exit

:run
dir .\xcuts\
more .\sysroot\class\2a.cl
set /p "p=Launch > "
.\xcuts\%p%\%p%.cmd
goto menu

:load
dir .\sysroot\custom\menulist\
set /p "m=Menu Script File [only name] > "
set localmenupath=.\sysroot\custom\menulist\%m%.cmsf
goto menu

:spr
more .\sysroot\class\2b.cl
set /p "c=PC/"%username%"~# "
%c%
echo.
goto prompt

:prompt
set /p "c=PC/"%username%"~# "
%c%
echo.
set c= 
goto prompt

:options
cls
more .\sysroot\class\2c.cl
set /p "so=>> "
if %so%== r shutdown -r -t 0
if %so%== s shutdown -s -t 0
if %so%== l shutdown -l