# Trunk-Based Development com Tags

Este projeto demonstra um fluxo de trabalho de Trunk-Based Development (TBD) com controle de versões usando tags.

## Sobre o projeto

Este é um projeto de exemplo que simula deploys com GitHub Actions utilizando:

- Deploy padrão da branch `main` (trunk)
- Deploy de tags ou commits específicos
- Controle de versões seguindo SemVer (X.Y.Z)

## Conceitos de Trunk-Based Development

O Trunk-Based Development é uma prática de desenvolvimento em que:

- A equipe trabalha principalmente em uma única branch (trunk/main)
- Merges frequentes são realizados ao trunk
- Branches de feature são de curta duração
- Releases são criados a partir de tags no trunk

## Estrutura do projeto

```
.
├── .github/workflows/   # Workflows do GitHub Actions
├── scripts/             # Scripts de automatização
│   ├── bump-version.sh  # Script para incrementar versão
│   └── tag-version.sh   # Script para criar tags
├── deploy.sh            # Script de simulação de deploy
├── server.js            # Servidor Node.js simples
├── package.json         # Configuração do projeto
└── VERSION              # Arquivo com a versão atual
```

## Como usar

1. Clone o repositório
2. Faça suas alterações
3. Atualize a versão: `./scripts/bump-version.sh [patch|minor|major]`
4. Commit suas alterações
5. Crie uma tag: `./scripts/tag-version.sh`
6. Envie para o GitHub: `git push && git push --tags`
7. Execute deploy pelo GitHub Actions

## Consulte também

- Veja o arquivo [CONTRIBUTING.md](CONTRIBUTING.md) para mais detalhes sobre como contribuir seguindo o modelo Trunk-Based Development.
- Para um guia completo de como testar este projeto no GitHub, consulte [GUIA-GITHUB.md](GUIA-GITHUB.md).
