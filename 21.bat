@echo off
setlocal enabledelayedexpansion

rem 设置关键词和目标文件夹
set "keyword=QOS"  rem 替换为你的关键词
echo "搜索关键词: !keyword!"
set "targetFolder=D:\18\iwara\4\CombinedFolders12"  rem 设置目标文件夹路径
chcp 65001

rem 创建目标文件夹（如果不存在）
if not exist "!targetFolder!" (
    mkdir "!targetFolder!"
)

rem 遍历当前目录的所有子目录及其文件
for /r %%D in (.) do (
    set "folderFound=false"
    echo "检查目录: %%D"

    rem 检查每个子目录中的视频文件
    for %%F in ("%%D\*.mp4" "%%D\*.avi" "%%D\*.mkv" "%%D\*.mov" "%%D\*.wmv") do (
        echo "找到文件: %%F"
        
        rem 检查文件名是否包含关键词
        echo %%~nxF | findstr /i "!keyword!" >nul
        if !errorlevel! == 0 (
            echo 找到包含关键词的文件: %%F
            set "folderFound=true"
        )
    )

    rem 如果找到了包含关键词的文件，则移动文件夹
    if "!folderFound!"=="true" (
        echo 正在移动文件夹 "%%D" 到 "!targetFolder!"
        move "%%D" "!targetFolder!"
    )
)

pause
echo 完成搜索和移动操作。
