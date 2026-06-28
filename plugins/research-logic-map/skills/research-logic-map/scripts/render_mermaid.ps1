$ErrorActionPreference = "Stop"

if (!(Test-Path "outputs")) {
New-Item -ItemType Directory -Path "outputs" | Out-Null
}

$mmd = "outputs/research_logic.mmd"
$svg = "outputs/research_logic.svg"
$png = "outputs/research_logic.png"

if (!(Test-Path $mmd)) {
Write-Error "找不到 outputs/research_logic.mmd，请先生成 Mermaid 文件。"
}

Write-Host "正在渲染 Mermaid 逻辑图..."

npx -y @mermaid-js/mermaid-cli -i $mmd -o $svg
npx -y @mermaid-js/mermaid-cli -i $mmd -o $png

Write-Host "完成："
Write-Host $svg
Write-Host $png
