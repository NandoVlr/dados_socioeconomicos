# Análise de Dados Socioeconômicos

Este projeto contém uma base simulada de dados socioeconômicos da população e diversas consultas SQL para responder questionamentos típicos da gestão pública.

## Arquivos

- `estrutura.sql` – script para criação da tabela.
- `base_simulada.csv` – arquivo com dados.
- `consultas.sql` – consultas para análise dos dados.

## Importação no MySQL

1. Execute `estrutura.sql` para criar a tabela.
2. Importe os dados via Workbench 
3. Vá até a aba de tabela, clique com o botão direito em populacao e escolha Table Data Import Wizard.
4. Siga o assistente e associe as colunas corretamente.
5. Finalize e ele irá importar os dados.
6. Execute as consultas desejadas no `consulta.sql`.