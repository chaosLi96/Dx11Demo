# =============================================================================
# PlantUML PNG 图片生成脚本 (PowerShell)
# =============================================================================
# 
# 功能：将当前目录下所有 .puml 文件生成为 PNG 图片
# 
# 使用方法：
#   1. 在 PowerShell 中运行：.\生成所有图片.ps1
#   2. 或右键点击 -> "使用 PowerShell 运行"
# 
# =============================================================================

# 设置控制台编码为 UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host ""
Write-Host "======================================" -ForegroundColor Cyan
Write-Host "  PlantUML 图片生成工具" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""

# 切换到脚本所在目录
Set-Location $PSScriptRoot

# PlantUML jar 文件路径
$PLANTUML_JAR = "C:\Users\zhaoq\.vscode\extensions\jebbs.plantuml-2.18.1\plantuml.jar"

# 检查 Java 是否安装
Write-Host "[1/3] 检查 Java 环境..." -ForegroundColor Yellow
try {
    $javaVersion = java -version 2>&1
    Write-Host "[√] Java 环境检测成功" -ForegroundColor Green
    Write-Host "    版本: $($javaVersion[0])" -ForegroundColor Gray
} catch {
    Write-Host "[×] 未检测到 Java，请先安装 Java Runtime Environment" -ForegroundColor Red
    Write-Host "    下载地址: https://www.java.com/zh-CN/download/" -ForegroundColor Gray
    Read-Host "按回车键退出"
    exit 1
}

# 检查 PlantUML jar 文件是否存在
Write-Host "[2/3] 检查 PlantUML jar 文件..." -ForegroundColor Yellow
if (-not (Test-Path $PLANTUML_JAR)) {
    Write-Host "[×] 未找到 PlantUML jar 文件" -ForegroundColor Red
    Write-Host "    期望路径: $PLANTUML_JAR" -ForegroundColor Gray
    Read-Host "按回车键退出"
    exit 1
}
Write-Host "[√] PlantUML jar 文件存在" -ForegroundColor Green

# 生成 PNG 图片
Write-Host "[3/3] 生成 PNG 图片..." -ForegroundColor Yellow
Write-Host ""

$pumlFiles = Get-ChildItem -Filter "*.puml"
Write-Host "找到 $($pumlFiles.Count) 个 .puml 文件" -ForegroundColor Gray
Write-Host ""

try {
    & java -jar $PLANTUML_JAR -tpng -charset UTF-8 *.puml
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "======================================" -ForegroundColor Green
        Write-Host "  生成完成！" -ForegroundColor Green
        Write-Host "======================================" -ForegroundColor Green
        Write-Host ""
        
        Write-Host "生成的图片：" -ForegroundColor Cyan
        Get-ChildItem -Filter "*.png" | ForEach-Object {
            $fileSize = [math]::Round($_.Length / 1KB, 2)
            Write-Host "  - $($_.Name) ($fileSize KB)" -ForegroundColor Gray
        }
    } else {
        Write-Host ""
        Write-Host "[×] 图片生成失败，请检查 .puml 文件语法" -ForegroundColor Red
    }
} catch {
    Write-Host ""
    Write-Host "[×] 执行出错: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""
Read-Host "按回车键退出"
