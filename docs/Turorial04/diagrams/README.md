# Tutorial04 PlantUML 图表说明

本目录包含 Tutorial04 项目的所有 PlantUML 图表源文件和生成的 PNG 图片。

## 📁 文件列表

### PlantUML 源文件 (.puml)
1. `01_class_diagram.puml` - 类图：数据结构关系
2. `02_component_diagram.puml` - 组件图：DirectX 11 渲染管线
3. `03_architecture_diagram.puml` - 架构图：系统分层结构
4. `04_deployment_diagram.puml` - 部署图：文件组织结构
5. `05_object_diagram.puml` - 对象图：运行时对象关系
6. `06_init_sequence.puml` - 序列图：初始化流程
7. `07_render_sequence.puml` - 序列图：渲染流程
8. `08_cleanup_sequence.puml` - 序列图：清理流程
9. `09_pipeline_activity.puml` - 活动图：渲染管线流程
10. `10_state_chart.puml` - 状态图：应用程序生命周期

### 生成的 PNG 图片
所有 `.puml` 文件都已使用 PlantUML 生成为对应的 PNG 图片，文件名格式为 `Tutorial04_*.png`。

## 🔧 如何重新生成图片

### 前置要求

1. **Java Runtime Environment (JRE)**
   - 版本要求：1.8 或更高
   - 验证安装：`java -version`

2. **PlantUML jar 文件**
   - 本机路径：`C:\Users\zhaoq\.vscode\extensions\jebbs.plantuml-2.18.1\plantuml.jar`
   - 或从 [PlantUML 官网](https://plantuml.com/zh/download) 下载最新版本

### 生成所有图片

在 PowerShell 中执行以下命令：

```powershell
# 进入 diagrams 目录
cd G:\Code\GitHub\DirectX11\Dx11Demo\docs\Turorial04\diagrams

# 生成所有 PNG 图片
java -jar "C:\Users\zhaoq\.vscode\extensions\jebbs.plantuml-2.18.1\plantuml.jar" -tpng -charset UTF-8 *.puml
```

### 生成单个图片

```powershell
# 生成特定的图片
java -jar "C:\Users\zhaoq\.vscode\extensions\jebbs.plantuml-2.18.1\plantuml.jar" -tpng -charset UTF-8 01_class_diagram.puml
```

### 命令参数说明

| 参数 | 说明 | 示例 |
|------|------|------|
| `-tpng` | 输出 PNG 格式 | 默认使用 |
| `-tsvg` | 输出 SVG 格式（矢量图） | `-tsvg` |
| `-tpdf` | 输出 PDF 格式 | `-tpdf` |
| `-charset UTF-8` | 指定 UTF-8 编码（支持中文） | **必须** |
| `-o <目录>` | 指定输出目录 | `-o output` |
| `-verbose` | 显示详细信息 | 调试时使用 |

### 常见问题

#### ❌ 问题1：中文显示为方块
**原因**：系统未安装微软雅黑字体或 PlantUML 未正确识别字体

**解决方案**：
1. 确认系统已安装微软雅黑字体（Windows 自带）
2. 检查每个 `.puml` 文件是否包含：`skinparam defaultFontName Microsoft YaHei`

#### ❌ 问题2：Java 命令找不到
**原因**：Java 未安装或未添加到系统 PATH

**解决方案**：
```powershell
# 检查 Java 是否安装
java -version

# 如果未安装，从官网下载：
# https://www.java.com/zh-CN/download/
```

#### ❌ 问题3：PlantUML jar 文件找不到
**原因**：jar 文件路径不正确

**解决方案**：
1. 检查 VS Code PlantUML 扩展的安装目录
2. 或下载独立的 plantuml.jar 文件
3. 使用绝对路径或将 jar 文件复制到当前目录

#### ❌ 问题4：生成失败，显示语法错误
**原因**：`.puml` 文件语法错误

**解决方案**：
```powershell
# 使用 -verbose 参数查看详细错误信息
java -jar "C:\Users\zhaoq\.vscode\extensions\jebbs.plantuml-2.18.1\plantuml.jar" -tpng -charset UTF-8 -verbose <文件名>.puml
```

### 批处理脚本

为了方便使用，可以创建批处理脚本：

**生成所有图片.bat**
```batch
@echo off
echo 开始生成 PlantUML 图片...
cd /d "%~dp0"
java -jar "C:\Users\zhaoq\.vscode\extensions\jebbs.plantuml-2.18.1\plantuml.jar" -tpng -charset UTF-8 *.puml
echo 完成！
pause
```

**生成所有图片.ps1 (PowerShell)**
```powershell
Write-Host "开始生成 PlantUML 图片..." -ForegroundColor Green
Set-Location $PSScriptRoot
java -jar "C:\Users\zhaoq\.vscode\extensions\jebbs.plantuml-2.18.1\plantuml.jar" -tpng -charset UTF-8 *.puml
Write-Host "完成！" -ForegroundColor Green
```

### 验证生成结果

生成成功后，应该看到：
- ✅ 控制台无错误信息
- ✅ diagrams 目录下出现 10 个 PNG 文件
- ✅ PNG 文件名格式：`Tutorial04_*.png`
- ✅ 打开图片，中文正常显示

## 🎨 字体配置

所有图表都配置为使用 **微软雅黑** 字体，以正确显示中文。

配置项已在每个 `.puml` 文件中添加：
```plantuml
skinparam defaultFontName Microsoft YaHei
```

## 📝 在文档中使用

在 Markdown 文档中，图片使用相对路径引用：

```markdown
![图表标题](diagrams/Tutorial04_*.png)
```

## 📄 相关文件

- `plantuml.config` - PlantUML 全局配置文件
- `../Claude总结文档.md` - 主文档，包含所有图表的引用

## 🔗 相关资源

- [PlantUML 官方网站](https://plantuml.com/zh/)
- [PlantUML 语法参考](https://plantuml.com/zh/guide)
