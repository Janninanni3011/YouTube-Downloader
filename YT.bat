@ECHO OFF
title YT Downloader
mode 20,10
CLS
:BEGIN
echo 1 = MP4
echo 2 = MP3
echo 3 = CUT
CHOICE /N /C:1234 /M "4 = Shitty Tiddy"
IF ERRORLEVEL ==4 GOTO Shitty
IF ERRORLEVEL ==3 GOTO CUT
IF ERRORLEVEL ==2 GOTO MP3
IF ERRORLEVEL ==1 GOTO MP4
:MP3
yt-dlp -P "C:\Users\%USERNAME%\Videos\YT Downloader\MP3" -x --no-keep-video --audio-format mp3 --audio-quality 0 "%*"
start %windir%\explorer.exe "C:\Users\Jannik\Videos\YT Downloader\MP3"
exit
:MP4
yt-dlp -P "C:\Users\%USERNAME%\Videos\YT Downloader\MP4" --format "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]" "%*"
start %windir%\explorer.exe "C:\Users\Jannik\Videos\YT Downloader\MP4"
exit
:CUT
set /p "start=Define Starttime: "
set /p "end=Define Endtime: "
yt-dlp -P "C:\Users\%USERNAME%\Videos\YT Downloader\MP4" --format "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]" "%*" --downloader ffmpeg --downloader-args "ffmpeg_i:-ss %start% -to %end%"
start %windir%\explorer.exe "C:\Users\Jannik\Videos\YT Downloader\MP4"
exit
:Shitty
yt-dlp -P "C:\Users\%USERNAME%\Videos\YT Downloader\Shitty Tiddy" --format "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]" "%*"
exit