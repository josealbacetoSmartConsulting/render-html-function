# Azure Function - Render HTML to PNG

Converte HTML em imagem PNG usando Playwright (sem Docker).

## 📋 Pré-requisitos

- Azure CLI instalado
- Node.js 20+ instalado localmente
- Conta Azure ativa

## 🚀 Deploy Rápido

### 1. Preparar arquivos
```powershell
.\prepare-deploy.ps1
```

### 2. Login no Azure
```bash
az login
```

### 3. Criar resources (primeira vez)
```bash
# Criar Resource Group
az group create --name myResourceGroup --location brazilsouth

# Criar Storage Account
az storage account create --name mystorageaccount --resource-group myResourceGroup --location brazilsouth --sku Standard_LRS

# Criar App Service Plan (Linux, B1 mínimo)
az functionapp plan create --resource-group myResourceGroup --name myAppServicePlan --location brazilsouth --number-of-workers 1 --sku B1 --is-linux

# Criar Function App
az functionapp create --resource-group myResourceGroup --name render-html-function --storage-account mystorageaccount --plan myAppServicePlan --runtime node --runtime-version 20 --functions-version 4 --os-type Linux
```

### 4. Deploy
```bash
func azure functionapp publish render-html-function
```

### 5. Configurar Azure (VIA PORTAL OU CLI)

#### Via CLI:
```bash
# Configurar App Settings
az functionapp config appsettings set --name render-html-function --resource-group myResourceGroup --settings PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=0 PLAYWRIGHT_BROWSERS_PATH=/home/site/wwwroot/node_modules/playwright-core/.local-browsers WEBSITE_RUN_FROM_PACKAGE=0

# Configurar Startup Command
az functionapp config set --name render-html-function --resource-group myResourceGroup --startup-file "bash -c 'cd /home/site/wwwroot && chmod +x install-dependencies.sh && ./install-dependencies.sh'"

# Reiniciar
az functionapp restart --name render-html-function --resource-group myResourceGroup
```

#### Via Portal Azure:
Consulte [AZURE-CONFIG.md](AZURE-CONFIG.md) para instruções detalhadas.

## 📖 Documentação Completa

- **[DEPLOY-NO-DOCKER.md](DEPLOY-NO-DOCKER.md)** - Guia completo de deploy com 3 métodos
- **[AZURE-CONFIG.md](AZURE-CONFIG.md)** - Configurações do Azure Portal
- **[prepare-deploy.ps1](prepare-deploy.ps1)** - Script de preparação
- **[install-dependencies.sh](install-dependencies.sh)** - Instalação de dependências Linux

## 🧪 Testar

```bash
# Obter URL e Key
FUNCTION_URL=$(az functionapp function show --name render-html-function --resource-group myResourceGroup --function-name RenderHtml --query "invokeUrlTemplate" -o tsv)
FUNCTION_KEY=$(az functionapp keys list --name render-html-function --resource-group myResourceGroup --query "functionKeys.default" -o tsv)

# Testar
curl -X POST "$FUNCTION_URL?code=$FUNCTION_KEY" \
  -H "Content-Type: application/json" \
  -d '{"html": "<h1>Hello World</h1>", "maxwidth": 800}'
```

## ⚠️ Importante

- **Use App Service Plan B1 ou superior** (Consumption Plan pode não funcionar)
- A primeira execução pode demorar (instalação de dependências)
- Monitore memória e considere B2 se necessário

## 🐛 Troubleshooting

Ver logs em tempo real:
```bash
func azure functionapp logstream render-html-function
```

SSH na Function App:
```bash
az webapp ssh --name render-html-function --resource-group myResourceGroup
```

## 📝 API

### Endpoint
```
POST https://<nome-function-app>.azurewebsites.net/api/RenderHtml
```

### Request Body
```json
{
  "html": "<h1>Hello World</h1><p>Test</p>",
  "maxwidth": 800
}
```

### Response
```json
{
  "base64": "iVBORw0KGgoAAAANSUhEUg..."
}
```
