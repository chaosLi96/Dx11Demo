import re

# 读取文档
with open('Claude总结文档.md', 'r', encoding='utf-8') as f:
    content = f.read()

# 定义替换映射
replacements = [
    (r'### 2\. 组件图.*?```plantuml.*?@enduml\s*```', 
     '### 2. 组件图 - DirectX 11 渲染管线\n\n![组件图 - DirectX 11 渲染管线](diagrams/Tutorial04_ComponentDiagram.png)\n\n**说明**: 展示了应用程序、DirectX 11设备、资源和渲染管线之间的组件关系。\n\n[查看源文件](diagrams/02_component_diagram.puml)\n\n---'),
    
    (r'### 3\. 架构图.*?```plantuml.*?@enduml\s*```',
     '### 3. 架构图 - 系统分层结构\n\n![架构图 - 系统分层结构](diagrams/Tutorial04_Architecture.png)\n\n**说明**: 展示了从应用程序层到GPU硬件的完整系统分层架构。\n\n[查看源文件](diagrams/03_architecture_diagram.puml)\n\n---'),
    
    (r'### 4\. 部署图.*?```plantuml.*?@enduml\s*```',
     '### 4. 部署图 - 文件组织结构\n\n![部署图 - 文件组织结构](diagrams/Tutorial04_Deployment.png)\n\n**说明**: 展示了项目文件、编译产物和运行时依赖的组织关系。\n\n[查看源文件](diagrams/04_deployment_diagram.puml)\n\n---'),
    
    (r'### 5\. 对象图.*?```plantuml.*?@enduml\s*```',
     '### 5. 对象图 - 运行时对象关系\n\n![对象图 - 运行时对象关系](diagrams/Tutorial04_ObjectDiagram.png)\n\n**说明**: 展示了运行时所有DirectX 11对象实例及其相互关系。\n\n[查看源文件](diagrams/05_object_diagram.puml)\n\n---'),
    
    (r'### 6\. 序列图 - 初始化流程.*?```plantuml.*?@enduml\s*```',
     '### 6. 序列图 - 初始化流程\n\n![序列图 - 初始化流程](diagrams/Tutorial04_InitSequence.png)\n\n**说明**: 详细展示了从程序启动到完成DirectX 11初始化的完整流程。\n\n[查看源文件](diagrams/06_init_sequence.puml)\n\n---'),
    
    (r'### 7\. 序列图 - 渲染流程.*?```plantuml.*?@enduml\s*```',
     '### 7. 序列图 - 渲染流程\n\n![序列图 - 渲染流程](diagrams/Tutorial04_RenderSequence.png)\n\n**说明**: 展示了每一帧的渲染流程，从更新数据到呈现到屏幕。\n\n[查看源文件](diagrams/07_render_sequence.puml)\n\n---'),
    
    (r'### 8\. 序列图 - 清理流程.*?```plantuml.*?@enduml\s*```',
     '### 8. 序列图 - 清理流程\n\n![序列图 - 清理流程](diagrams/Tutorial04_CleanupSequence.png)\n\n**说明**: 展示了程序退出时的资源清理顺序。\n\n[查看源文件](diagrams/08_cleanup_sequence.puml)\n\n---'),
    
    (r'### 9\. 活动图 - 渲染管线流程.*?```plantuml.*?@enduml\s*```',
     '### 9. 活动图 - 渲染管线流程\n\n![活动图 - 渲染管线流程](diagrams/Tutorial04_PipelineActivity.png)\n\n**说明**: 展示了GPU渲染管线各阶段的活动流程。\n\n[查看源文件](diagrams/09_pipeline_activity.puml)\n\n---'),
    
    (r'### 10\. 状态图 - 应用程序生命周期.*?```plantuml.*?@enduml\s*```',
     '### 10. 状态图 - 应用程序生命周期\n\n![状态图 - 应用程序生命周期](diagrams/Tutorial04_StateChart.png)\n\n**说明**: 展示了应用程序从初始化、运行到清理的完整状态转换。\n\n[查看源文件](diagrams/10_state_chart.puml)\n\n---'),
]

# 执行替换
for pattern, replacement in replacements:
    content = re.sub(pattern, replacement, content, flags=re.DOTALL)

# 保存结果
with open('Claude总结文档.md', 'w', encoding='utf-8') as f:
    f.write(content)

print("文档更新完成！")
