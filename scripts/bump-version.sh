#!/bin/bash

# Script para incrementar a versão do projeto
# Uso: ./bump-version.sh [major|minor|patch]

CURRENT_VERSION=$(cat VERSION)
echo "📌 Versão atual: $CURRENT_VERSION"

# Extrair componentes da versão
IFS='.' read -r -a version_parts <<< "$CURRENT_VERSION"
MAJOR=${version_parts[0]}
MINOR=${version_parts[1]}
PATCH=${version_parts[2]}

# Determinar o tipo de incremento
INCREMENT_TYPE="${1:-patch}"

case $INCREMENT_TYPE in
  major)
    MAJOR=$((MAJOR + 1))
    MINOR=0
    PATCH=0
    ;;
  minor)
    MINOR=$((MINOR + 1))
    PATCH=0
    ;;
  patch)
    PATCH=$((PATCH + 1))
    ;;
  *)
    echo "❌ Tipo de incremento inválido. Use: major, minor ou patch"
    exit 1
    ;;
esac

# Nova versão
NEW_VERSION="$MAJOR.$MINOR.$PATCH"
echo "🆙 Nova versão: $NEW_VERSION"

# Atualizar o arquivo VERSION
echo $NEW_VERSION > VERSION

# Atualizar o package.json
if [ -f package.json ]; then
  # Usando sed para atualizar a versão no package.json
  sed -i.bak "s/\"version\": \"$CURRENT_VERSION\"/\"version\": \"$NEW_VERSION\"/" package.json && rm package.json.bak
  echo "📝 Atualizado package.json"
fi

echo "✅ Versão incrementada com sucesso!"
echo "🔔 Lembre-se de commitar estas mudanças." 