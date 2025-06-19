#!/bin/bash

# Script para listar todas as tags do repositório com informações adicionais

echo "🏷️  Tags disponíveis no repositório:"
echo "--------------------------------"

# Verificar se existem tags
if [ -z "$(git tag -l)" ]; then
  echo "❌ Nenhuma tag encontrada no repositório."
  exit 0
fi

# Função para obter a data de criação da tag
get_tag_date() {
  git log -1 --format=%ai "$1" 2>/dev/null
}

# Listar todas as tags com data e mensagem
for tag in $(git tag -l | sort -V); do
  date=$(get_tag_date "$tag")
  message=$(git tag -l --format='%(contents:subject)' "$tag")
  echo "📌 $tag"
  echo "   Data: $date"
  echo "   Mensagem: $message"
  echo "   Commit: $(git rev-list -n 1 $tag)"
  echo "--------------------------------"
done

echo ""
echo "💡 Para fazer deploy de uma tag específica:"
echo "   ./scripts/deploy-tag.sh <nome-da-tag>" 