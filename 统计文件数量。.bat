@echo off
setlocal enabledelayedexpansion
chcp 65001
rem 设置输出文件名
set "outputFile=file_count_report.txt"
> "!outputFile!" (
    echo 目录文件数量统计报告
    echo ===========================
)

rem 遍历当前目录下的所有子目录及其子目录
for /r %%D in (.) do (
    set "fileCount=0"

    rem 遍历每个子目录中的文件
    for %%F in ("%%D\*") do (
        if not "%%~aF"=="d" (
            set /a fileCount+=1
        )
    )

    rem 如果文件计数不为零，将结果写入输出文件
    if !fileCount! gtr 0 (
        echo %%D: !fileCount! >> "!outputFile!"
    )
)

echo 完成统计，结果已写入 "!outputFile!"。
pause
