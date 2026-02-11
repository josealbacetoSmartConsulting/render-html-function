# Deploy Azure Function com Playwright (Sem Docker)

## Método 1: Azure App Service Plan (Recomendado)

### Pré-requisitos
- Azure CLI instalado
- Conta Azure ativa

### Passos para Deploy

#### 1. Login no Azure
```bash
az login
```

#### 2. Criar Resource Group
```bash
az group create --name myResourceGroup --location brazilsouth
```

#### 3. Criar Storage Account
```bash
az storage account create \
  --name mystorageaccount \
  --resource-group myResourceGroup \
  --location brazilsouth \
  --sku Standard_LRS
```

#### 4. Criar App Service Plan (Linux)
```bash
az functionapp plan create \
  --resource-group myResourceGroup \
  --name myAppServicePlan \
  --location brazilsouth \
  --number-of-workers 1 \
  --sku B1 \
  --is-linux
```

#### 5. Criar Function App
```bash
az functionapp create \
  --resource-group myResourceGroup \
  --name render-html-function \
  --storage-account mystorageaccount \
  --plan myAppServicePlan \
  --runtime node \
  --runtime-version 20 \
  --functions-version 4 \
  --os-type Linux
```

#### 6. Configurar Script de Startup
```bash
az functionapp config set \
  --resource-group myResourceGroup \
  --name render-html-function \
  --startup-file "/home/site/wwwroot/install-dependencies.sh"
```

#### 7. Configurar Application Settings
```bash
az functionapp config appsettings set \
  --name render-html-function \
  --resource-group myResourceGroup \
  --settings \
    "PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=0" \
    "PLAYWRIGHT_BROWSERS_PATH=/home/site/wwwroot/node_modules/playwright-core/.local-browsers"
```

#### 8. Deploy do código
```bash
# Via ZIP deploy
func azure functionapp publish render-html-function

# OU via VS Code
# Use a extensão Azure Functions e clique em "Deploy to Function App"
```

#### 9. Reiniciar Function App
```bash
az functionapp restart \
  --name render-html-function \
  --resource-group myResourceGroup
```

---

## Método 2: Consumption Plan (Mais Barato, mas pode ter problemas)

**⚠️ AVISO:** O Consumption Plan tem limitações e pode não funcionar perfeitamente com Playwright devido às restrições de memória e tempo de cold start.

```bash
az functionapp create \
  --resource-group myResourceGroup \
  --consumption-plan-location brazilsouth \
  --runtime node \
  --runtime-version 20 \
  --functions-version 4 \
  --name render-html-function \
  --storage-account mystorageaccount \
  --os-type Linux
```

---

## Método 3: Deploy Manual via Portal Azure

1. Acesse o Portal Azure
2. Crie um **Function App** com:
   - Sistema Operacional: **Linux**
   - Runtime: **Node.js 20**
   - Region: **Brazil South**
   - Plan: **App Service Plan** (B1 ou superior)

3. Após criado, vá em **Configuration** → **Application Settings**:
   - Adicione: `PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD = 0`
   - Adicione: `PLAYWRIGHT_BROWSERS_PATH = /home/site/wwwroot/node_modules/playwright-core/.local-browsers`

4. Vá em **Configuration** → **General Settings**:
   - **Startup Command**: `/home/site/wwwroot/install-dependencies.sh`

5. Deploy via VS Code:
   - Instale a extensão "Azure Functions"
   - Clique com botão direito na pasta do projeto
   - Selecione "Deploy to Function App..."
   - Selecione sua Function App

6. Aguarde o deploy e reinicie a Function App

---

## Alternativa: Usar Puppeteer com Chrome no Consumo

Se o Playwright não funcionar bem no Consumption Plan, considere usar **Puppeteer** com o **chrome-aws-lambda**:

```bash
npm uninstall playwright
npm install puppeteer-core chrome-aws-lambda
```

E modifique o código para usar Puppeteer ao invés de Playwright.

---

## Testar a Function

```bash
# Obter a Function URL
FUNCTION_URL=$(az functionapp function show \
  --name render-html-function \
  --resource-group myResourceGroup \
  --function-name RenderHtml \
  --query "invokeUrlTemplate" -o tsv)

# Obter Function Key
FUNCTION_KEY=$(az functionapp keys list \
  --name render-html-function \
  --resource-group myResourceGroup \
  --query "functionKeys.default" -o tsv)

# Testar
curl -X POST "$FUNCTION_URL?code=$FUNCTION_KEY" \
  -H "Content-Type: application/json" \
  -d '{"html": "<h1>Hello World</h1>", "maxwidth": 800}'
```

---

## Troubleshooting

### Ver logs em tempo real:
```bash
func azure functionapp logstream render-html-function
```

### SSH na Function App:
```bash
az webapp ssh --name render-html-function --resource-group myResourceGroup
```

### Verificar se dependências foram instaladas:
```bash
# No SSH:
ldd /home/site/wwwroot/node_modules/playwright-core/.local-browsers/chromium-*/chrome-linux/chrome
```

---

## Notas Importantes

- **App Service Plan (B1+)** é necessário para rodar Playwright de forma confiável
- O script `install-dependencies.sh` será executado automaticamente no startup
- Pode levar alguns minutos na primeira inicialização
- Em caso de erro de memória, considere upgrade para **B2 ou P1V2**
