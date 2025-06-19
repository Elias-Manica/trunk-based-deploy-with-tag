# Guia de Contribuição

Este projeto segue o modelo de desenvolvimento **Trunk-Based Development** com uso de tags para controle de versões.

## Fluxo de trabalho

1. **Desenvolva diretamente na branch `main`**

   - Para features menores, commits diretamente na `main`
   - Para features maiores, use branches de curta duração que são mescladas frequentemente

2. **Mantenha commits pequenos e frequentes**

   - Evite acumular muitas alterações em um único commit
   - Cada commit deve representar uma unidade lógica de trabalho

3. **Versionamento com tags**
   - Usamos [Versionamento Semântico](https://semver.org/lang/pt-BR/)
   - As tags seguem o formato `vX.Y.Z`
     - **X**: Versão maior (breaking changes)
     - **Y**: Versão menor (novas funcionalidades compatíveis)
     - **Z**: Versão de correção (correções de bugs compatíveis)

## Comandos úteis

### Incrementar a versão

```bash
# Incrementa a versão de patch (1.0.0 -> 1.0.1)
./scripts/bump-version.sh patch

# Incrementa a versão menor (1.0.0 -> 1.1.0)
./scripts/bump-version.sh minor

# Incrementa a versão maior (1.0.0 -> 2.0.0)
./scripts/bump-version.sh major
```

### Criar uma tag

```bash
./scripts/tag-version.sh
```

### Executar deploy

```bash
./deploy.sh
```

## Boas práticas

1. **Integre frequentemente**

   - Faça pull da main regularmente
   - Resolva conflitos o mais cedo possível

2. **Testes primeiro**

   - Garanta que seus commits não quebrem a build
   - Execute testes localmente antes de enviar

3. **Use Feature Flags**
   - Para features grandes que não estão prontas para produção
   - Permite mesclar código incompleto sem afetar usuários
