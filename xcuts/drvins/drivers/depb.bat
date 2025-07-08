@echo off
echo En/De Coding stuff
echo PLEASE ASSIGN FILE TO RUN WITH:
echo "set pbexc=<filename>"
echo "set pbpath=<filepath>"
echo And Press [ENTER]
pause>nul
rename %pbpath%%pbexc% exec.bat
%pbpath%exec.bat
rename %pbpath%exec.bat %pbexc%