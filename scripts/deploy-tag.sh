#!/bin/bash

# Script para facilitar o deploy de uma tag específica
# Uso: ./scripts/deploy-tag.sh [tag]

if [ -z "$1" ]; then
  echo "❌ É necessário especificar uma tag para deploy."
  echo "Uso: ./scripts/deploy-tag.sh v1.0.0"
  exit 1
fi

TAG=$1

# Verificar se a tag existe
if ! git rev-parse "$TAG" >/dev/null 2>&1; then
  echo "❌ A tag '$TAG' não existe no repositório."
  echo "Tags disponíveis:"
  git tag -l
  exit 1
fi

echo "🔍 Preparando deploy da tag: $TAG"

# Checkout da tag em um estado destacado (detached HEAD)
git checkout "$TAG"

echo "✅ Agora você está na tag $TAG"
echo "🚀 Execute o deploy com: ./deploy.sh"
echo ""
echo "⚠️ ATENÇÃO: Você está em um estado 'detached HEAD'."
echo "Para voltar à branch main após o deploy, execute: git checkout main" 