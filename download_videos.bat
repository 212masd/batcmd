@echo off
mkdir 4
cd 4

setlocal enabledelayedexpansion

for /f "delims=" %%i in (..\urls.txt) do (
    mkdir video
	cd video
    echo 正在下载: %%i
    yt-dlp --concurrent-fragments 8 %%i
)

pause
