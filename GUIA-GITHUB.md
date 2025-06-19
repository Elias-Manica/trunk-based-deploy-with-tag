# Guia para Testar no GitHub

Este guia explica como configurar e testar seu projeto no GitHub usando o fluxo de Trunk-Based Development com tags.

## Configuração Inicial

1. **Crie um repositório no GitHub**

   - Acesse [github.com/new](https://github.com/new)
   - Dê um nome ao repositório (ex: `trunk-based-with-tags`)
   - Deixe público ou privado conforme sua preferência
   - Não inicialize com README, .gitignore ou licença

2. **Inicialize o repositório local e envie para o GitHub**

   ```bash
   git init
   git add .
   git commit -m "Commit inicial"
   git branch -M main
   git remote add origin https://github.com/SEU-USUARIO/trunk-based-with-tags.git
   git push -u origin main
   ```

3. **Verifique as GitHub Actions**
   - Acesse a aba "Actions" no seu repositório GitHub
   - Você deverá ver o workflow `Deploy Node App` disponível

## Fluxo de Trabalho Normal (via main)

1. **Faça alterações no código**

   ```bash
   # Exemplo: alterar a mensagem no server.js
   # Edite o arquivo server.js
   ```

2. **Commit e push para a main**

   ```bash
   git add .
   git commit -m "Atualização na mensagem de boas-vindas"
   git push origin main
   ```

3. **Execute o deploy via GitHub Actions**
   - Acesse a aba "Actions" no GitHub
   - Clique em "Deploy Node App"
   - Clique em "Run workflow"
   - Deixe o campo "Tag ou commit SHA para deploy" em branco (usará a main)
   - Clique em "Run workflow" verde

## Fluxo de Trabalho com Tags

1. **Faça alterações no código**

   ```bash
   # Exemplo: adicionar uma nova funcionalidade
   ```

2. **Atualize a versão do projeto**

   ```bash
   # Para uma mudança pequena (patch)
   ./scripts/bump-version.sh patch

   # Para uma nova funcionalidade (minor)
   ./scripts/bump-version.sh minor

   # Para uma mudança que quebra compatibilidade (major)
   ./scripts/bump-version.sh major
   ```

3. **Commit das alterações incluindo a versão atualizada**

   ```bash
   git add .
   git commit -m "Adicionada nova funcionalidade X - v1.1.0"
   git push origin main
   ```

4. **Crie uma tag para a versão**

   ```bash
   ./scripts/tag-version.sh
   git push origin v1.1.0  # Substitua pela sua versão atual
   ```

5. **Execute o deploy da tag específica via GitHub Actions**
   - Acesse a aba "Actions" no GitHub
   - Clique em "Deploy Node App"
   - Clique em "Run workflow"
   - No campo "Tag ou commit SHA para deploy", digite a tag (ex: `v1.1.0`)
   - Clique em "Run workflow" verde

### Deploy local de uma tag específica

Se quiser testar localmente o código de uma tag específica:

```bash
# Use o script auxiliar
./scripts/deploy-tag.sh v1.0.0

# Ou faça manualmente
git checkout v1.0.0
./deploy.sh
git checkout main  # Voltar para a branch principal depois
```

## Verificando Histórico de Deploys

Para ver o histórico de execuções do workflow:

1. Acesse a aba "Actions" no GitHub
2. Clique em "Deploy Node App" na lista de workflows
3. Você verá todas as execuções anteriores, incluindo quais foram da main e quais foram de tags específicas

### Listando tags disponíveis

Para ver todas as tags disponíveis no repositório com detalhes:

```bash
./scripts/list-tags.sh
```

Este comando mostrará todas as tags com suas datas de criação, mensagens e commits associados.

## Rollback para uma Versão Anterior

Se precisar voltar para uma versão anterior:

1. Acesse a aba "Actions" no GitHub
2. Clique em "Deploy Node App"
3. Clique em "Run workflow"
4. No campo "Tag ou commit SHA para deploy", digite a tag anterior (ex: `v1.0.0`)
5. Clique em "Run workflow" verde
