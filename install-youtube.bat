@echo off
echo ======================================
echo    Installation YouTube Downloader
echo ======================================
echo.

:: Etape 1 - Creer le dossier scripts
echo [1/4] Creation du dossier scripts...
set SCRIPT_DIR=%USERPROFILE%\scripts
if not exist "%SCRIPT_DIR%" mkdir "%SCRIPT_DIR%"
echo OK - Dossier : %SCRIPT_DIR%
echo.

:: Etape 2 - Telecharger yt-dlp.exe directement
echo [2/4] Telechargement de yt-dlp.exe...
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe' -OutFile '%SCRIPT_DIR%\yt-dlp.exe'"
echo OK - yt-dlp.exe telecharge
echo.

:: Etape 3 - Creer le fichier youtube.bat
echo [3/4] Creation du raccourci "youtube"...
echo @echo off > "%SCRIPT_DIR%\youtube.bat"
echo yt-dlp --extractor-args "youtube:player_client=android" %%1 >> "%SCRIPT_DIR%\youtube.bat"
echo OK - Raccourci cree
echo.

:: Etape 4 - Ajouter au PATH
echo [4/4] Ajout au PATH...
setx PATH "%PATH%;%SCRIPT_DIR%"
echo OK - PATH mis a jour
echo.

:: Verification
echo ======================================
echo    Test de yt-dlp...
echo ======================================
"%SCRIPT_DIR%\yt-dlp.exe" --version
echo.

echo ======================================
echo    Installation terminee !
echo ======================================
echo.
echo Ferme ce CMD et rouvre-le, puis tape :
echo.
echo    youtube "https://youtu.be/XXXX"
echo.
echo ======================================
pause
