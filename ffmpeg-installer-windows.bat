@echo OFF
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo Running as Administrator, continuing...
) ELSE (
   echo ERROR: This script must be run as an Administrator.
   PAUSE
   EXIT /B 1
)

echo Downloading ffmpeg...
curl -Lo C:\ffmpeg.zip https://github.com/GyanD/codexffmpeg/releases/download/5.1.1/ffmpeg-5.1.1-essentials_build.zip
powershell -command "Expand-Archive -Path C:\ffmpeg.zip C:\ffmpeg"
echo Extracted archive
echo Moving files to Windows...
move C:\ffmpeg\ffmpeg-5.1.1-essentials_build\bin\ffmpeg.exe C:\Windows\ffmpeg.exe
move C:\ffmpeg\ffmpeg-5.1.1-essentials_build\bin\ffplay.exe C:\Windows\ffplay.exe
move C:\ffmpeg\ffmpeg-5.1.1-essentials_build\bin\ffprobe.exe C:\Windows\ffprobe.exe
echo Files Moved
echo Cleaning up...
rmdir /s /q C:\ffmpeg
del C:\ffmpeg.zip
echo Done!
PAUSE