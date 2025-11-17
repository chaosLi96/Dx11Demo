@echo off
REM =============================================================================
REM PlantUML PNG 图片生成脚本
REM =============================================================================
REM 
REM 功能：将当前目录下所有 .puml 文件生成为 PNG 图片
REM 
REM 使用方法：双击运行此批处理文件
REM 
REM =============================================================================

echo.
echo ======================================
echo   PlantUML 图片生成工具
echo ======================================
echo.

REM 切换到脚本所在目录
cd /d "%~dp0"

REM PlantUML jar 文件路径
set PLANTUML_JAR=C:\Users\zhaoq\.vscode\extensions\jebbs.plantuml-2.18.1\plantuml.jar

REM 检查 Java 是否安装
echo [1/3] 检查 Java 环境...
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo [错误] 未检测到 Java，请先安装 Java Runtime Environment
    echo 下载地址: https://www.java.com/zh-CN/download/
    pause
    exit /b 1
)
echo [√] Java 环境检测成功

REM 检查 PlantUML jar 文件是否存在
echo [2/3] 检查 PlantUML jar 文件...
if not exist "%PLANTUML_JAR%" (
    echo [错误] 未找到 PlantUML jar 文件
    echo 期望路径: %PLANTUML_JAR%
    pause
    exit /b 1
)
echo [√] PlantUML jar 文件存在

REM 生成 PNG 图片
echo [3/3] 生成 PNG 图片...
echo.
java -jar "%PLANTUML_JAR%" -tpng -charset UTF-8 *.puml

REM 检查是否成功
if %errorlevel% equ 0 (
    echo.
    echo ======================================
    echo   生成完成！
    echo ======================================
    echo.
    echo 生成的图片：
    dir /b *.png
) else (
    echo.
    echo [错误] 图片生成失败，请检查 .puml 文件语法
)

echo.
pause
