# Configuração Azure Function - Startup e App Settings

Este arquivo documenta as configurações necessárias no Azure Portal após o deploy.

## Application Settings (Variáveis de Ambiente)

Adicione estas configurações em: **Configuration > Application settings**

```
PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD = 0
PLAYWRIGHT_BROWSERS_PATH = /home/site/wwwroot/node_modules/playwright-core/.local-browsers
NODE_ENV = production
WEBSITE_RUN_FROM_PACKAGE = 0
```

## Startup Command

Configure em: **Configuration > General settings > Startup Command**

```bash
chmod +x /home/site/wwwroot/install-dependencies.sh && /home/site/wwwroot/install-dependencies.sh
```

**OU use este comando mais completo:**

```bash
bash -c "cd /home/site/wwwroot && chmod +x install-dependencies.sh && ./install-dependencies.sh && echo 'Dependencies installed'"
```

## Configurações Importantes

### App Service Plan
- **Sistema Operacional**: Linux
- **SKU mínimo**: B1 (Basic)
- **Recomendado**: B2 ou P1V2 para melhor performance

### Runtime
- **Runtime Stack**: Node.js
- **Version**: 20 LTS
- **Functions Version**: 4

## Verificar Instalação

Após deploy, acesse via SSH e verifique:

```bash
# Conectar via SSH
az webapp ssh --name <nome-function-app> --resource-group <resource-group>

# Verificar se libglib está instalada
ldconfig -p | grep libglib

# Verificar browsers do Playwright
ls -la /home/site/wwwroot/node_modules/playwright-core/.local-browsers/

# Testar dependências do Chrome
ldd /home/site/wwwroot/node_modules/playwright-core/.local-browsers/chromium-*/chrome-linux/chrome | grep "not found"
```

## Troubleshooting

### Erro "libglib-2.0.so.0: cannot open shared object file"
- Verifique se o startup command foi configurado corretamente
- Reinicie a Function App após configurar: `az functionapp restart`
- Verifique logs: `func azure functionapp logstream <nome-function-app>`

### Timeout na primeira execução
- Cold start pode demorar devido à instalação de dependências
- Considere usar warm-up request após deploy
- Aumente o timeout em host.json

### Memória insuficiente
- Upgrade para B2 (3.5 GB RAM) ou P1V2 (8 GB RAM)
- Monitore uso de memória em Metrics no Portal

## Comandos Úteis

```bash
# Ver logs em tempo real
func azure functionapp logstream <nome-function-app>

# Reiniciar Function App
az functionapp restart --name <nome-function-app> --resource-group <resource-group>

# Ver configurações atuais
az functionapp config appsettings list --name <nome-function-app> --resource-group <resource-group>

# SSH na Function App
az webapp ssh --name <nome-function-app> --resource-group <resource-group>
```
