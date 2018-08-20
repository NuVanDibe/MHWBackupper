rem You can remove all text above this line and run this again to set up a new .bat file.
@echo off
cls

if "%steamid%"=="" (
goto setid
) else (
goto main
)

:main

set tmpvar=%date:~10,4%-%date:~4,2%-%date:~7,2% %time:~0,2%.%time:~3,2%.%time:~6,2%
if %tmpvar:~11,2% LSS 10 set tmpvar=%tmpvar:~0,11%0%tmpvar:~-7%

if exist "%backuplocation%\%tmpvar%" rd /s /q "%backuplocation%\%tmpvar%"

xcopy /e /h /i "%programfiles(x86)%\Steam\userdata\%steamid%\582010" "%backuplocation%\%tmpvar%\save"

(
echo if exist "%programfiles(x86)%\Steam\userdata\%steamid%\582010" rd /s /q "%programfiles(x86)%\Steam\userdata\%steamid%\582010"
echo xcopy /e /h /i save "%programfiles(x86)%\Steam\userdata\%steamid%\582010"
)>"%backuplocation%\%tmpvar%\restore.bat"

goto eof

:setid
echo This will generate a .bat file which will back up your Monster Hunter World save file to
echo a directory of your choosing. It will generate a new backup every time you run the
echo output .bat file and the directory will be timestamped like this:
echo.
echo 2018-08-20 13.53.08
echo.
echo This example backup was made on August 20, 2018 at 8 seconds past 1:53 PM.
echo.
echo In this directory will be a .bat file called "restore.bat". Run this file to restore the
echo backup from this directory.
echo.
echo Warning: Do not backup or restore while Monster Hunter World is running! Doing so could
echo corrupt your save! I'm not responsible if something goes wrong!
echo.
pause
echo.
for /f %%G in ('dir "%programfiles(x86)%\Steam\userdata\*" /b') do set sid=%%~G
echo You need to set the Steam ID. This is most likely %sid%, unless you've signed into multiple Steam accounts.
set /p steamid=Type Steam ID: 
echo.
echo You need to set the backup directory. Example: C:\Backups\Monster Hunter World
echo Do not use a trailing backslash.
echo.
set /p backuplocation=Type Backup Directory: 

echo.
echo You need to set the output filename. (It must end in .bat or .cmd) Example: backupmhw.bat
echo.
set /p outputfile=Type Output Filename: 

if exist %outputfile% (
echo File already exists. Try again.
set steamid=
pause
goto eof
)

:makebat
(
echo @echo off
echo set steamid=%steamid%
echo set backuplocation=%backuplocation%
echo.
)>"%outputfile%" 
TYPE %~nx0>>%outputfile%

:eof
