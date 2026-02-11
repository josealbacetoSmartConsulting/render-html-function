#!/bin/bash
# Script de instalação das dependências do Playwright para Azure Functions
# Este script deve ser executado automaticamente no startup do Azure App Service

echo "Instalando dependências do sistema para Playwright/Chromium..."

# Atualizar lista de pacotes
apt-get update -y

# Instalar dependências necessárias para o Chromium
apt-get install -y \
    libnss3 \
    libnspr4 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libdbus-1-3 \
    libxkbcommon0 \
    libatspi2.0-0 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    libgbm1 \
    libpango-1.0-0 \
    libcairo2 \
    libasound2 \
    libglib-2.0-0 \
    fonts-liberation

echo "Instalando browsers do Playwright..."
npx playwright install chromium
npx playwright install-deps chromium

echo "Instalação concluída!"
