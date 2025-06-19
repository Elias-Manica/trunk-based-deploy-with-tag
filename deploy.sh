#!/bin/bash

echo "🔧 Iniciando processo de deploy..."
echo "🗂 Commit atual:"
git log -1 --oneline

echo "🚀 Simulando build e deploy..."
sleep 2
echo "✅ Deploy completo com sucesso!" 