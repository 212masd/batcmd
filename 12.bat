@echo off
setlocal enabledelayedexpansion
chcp 65001


rem 设置输出文件的名称
set "outputFile=directory_structure.txt"

rem 删除之前的输出文件（如果存在）
if exist "%outputFile%" (
    del "%outputFile%"
)

rem 遍历当前目录及其子目录，并将文件结构输出到文本文件
echo 当前目录结构： > "%outputFile%"
dir /s /b >> "%outputFile%"

echo 文件结构已保存到 "%outputFile%"
