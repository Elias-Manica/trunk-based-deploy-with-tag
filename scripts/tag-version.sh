#!/bin/bash

# Script para criar tags de versão

# Verificar se temos mudanças não commitadas
if [ -n "$(git status --porcelain)" ]; then
  echo "❌ Existem mudanças não commitadas. Por favor, commit ou stash antes de criar uma tag."
  exit 1
fi

# Ler a versão atual do arquivo VERSION
VERSION=$(cat VERSION)
echo "📌 Versão atual: $VERSION"

# Verificar se essa tag já existe
if git rev-parse "v$VERSION" >/dev/null 2>&1; then
  echo "❌ Tag v$VERSION já existe!"
  exit 1
fi

# Criar a tag
echo "🏷️ Criando tag v$VERSION..."
git tag -a "v$VERSION" -m "Release versão $VERSION"

echo "⬆️ Para enviar a tag ao repositório remoto, execute:"
echo "git push origin v$VERSION" 