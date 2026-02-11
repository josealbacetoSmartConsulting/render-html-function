# Script para preparar o deploy da Azure Function
Write-Host "Preparando arquivos para deploy..." -ForegroundColor Cyan

# Tornar o script bash executável (para WSL/Git Bash)
if (Test-Path "install-dependencies.sh") {
    Write-Host "✓ Script install-dependencies.sh encontrado" -ForegroundColor Green
    
    # Converter CRLF para LF (importante para Linux)
    $content = Get-Content "install-dependencies.sh" -Raw
    $content = $content -replace "`r`n", "`n"
    Set-Content "install-dependencies.sh" -Value $content -NoNewline
    
    Write-Host "✓ Convertido para formato Linux (LF)" -ForegroundColor Green
}

# Verificar package.json
if (Test-Path "package.json") {
    Write-Host "✓ package.json encontrado" -ForegroundColor Green
}

# Verificar host.json
if (Test-Path "host.json") {
    Write-Host "✓ host.json encontrado" -ForegroundColor Green
}

Write-Host "`nPronto para deploy!" -ForegroundColor Green
Write-Host "Execute: func azure functionapp publish <nome-da-function-app>" -ForegroundColor Yellow
