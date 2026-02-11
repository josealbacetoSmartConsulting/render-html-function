# Como Mudar para App Service Plan (se necessário)

Se sua Function App está em **Consumption Plan** (Y1), você precisa migrar para um App Service Plan.

## AVISO: Isto gerará custos adicionais
- Consumption: ~Grátis (pay-per-use)
- B1 Basic: ~R$ 60-80/mês
- B2 Basic: ~R$ 120-160/mês

## Passos para Migrar

### Opção 1: Via CLI (Recomendado)

```bash
# 1. Criar novo App Service Plan
az functionapp plan create \
  --resource-group <seu-resource-group> \
  --name myNewAppServicePlan \
  --location brazilsouth \
  --number-of-workers 1 \
  --sku B1 \
  --is-linux

# 2. Migrar a Function App para o novo plano
az functionapp update \
  --name <nome-da-sua-function> \
  --resource-group <seu-resource-group> \
  --plan myNewAppServicePlan
```

### Opção 2: Via Portal (Criar nova Function)

Infelizmente, não é possível mudar o plano diretamente no Portal se já estiver em Consumption.
Você precisaria:

1. Criar uma nova Function App com App Service Plan:
   - Criar Function App → Choose **App Service Plan** como Hosting Plan
   - Selecionar **Linux** como OS
   - Escolher ou criar um plano **B1** ou superior

2. Fazer redeploy do código na nova Function App:
   ```bash
   func azure functionapp publish <nova-function-app-name>
   ```

3. Atualizar referências/URLs no seu sistema

4. Deletar a Function App antiga (opcional)

### Verificar o Plano atual

```bash
az functionapp show --name <nome-function> --resource-group <resource-group> --query "appServicePlanId"
```

Se o resultado contém *"Dynamic"* ou *"Y1"*, você está em Consumption Plan.
