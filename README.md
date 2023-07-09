# Pokedex
Aplicativo descrevendo as características de todos os Pokémons existentes

Desenvolvido como atividade de conclusão da disciplina Flutter I,
do curso de pós-graduação em Aplicativos Móveis do IESB, 2023-1.

Prof. Marcos Dias Vendramini

## Autor
Marcelo Amarante Ferreira Gomes (Matrícula 2373171024)

## Modo de usar
Esse é um aplicativo simples, que utiliza a API PokéAPI, documentada
em [https://pokeapi.co/docs/v2](https://pokeapi.co/docs/v2), para obter dados sobre todos os Pokémons
existentes, e listá-los por categoria.

### Implementação executada
Ao ser aberto pela primeira vez, o app busca na API e guarda
num  banco de dados local a estrutura textual descrevendo
todos os Pokémons, e apresentando uma lista dos tipos existentes.

Além do mínimo pedido no enunciado abaixo transcrito, temos
também a tela de tipos de Pokémons existentes.

Ao se clicar sobre um desses tipos, é aberta uma lista com
os Pokémons daquele tipo, para só então, ao se clicar sobre
um dos Pokémons, abre-se a tela com o detalhamento daquele
Pokémon específico.

A partir de qualquer das telas, é possível o acionamento
do botão de informações do app, trazendo os dados do autor,
incluindo forma de contato.

## ENUNCIADO:
Escolha algum WebService que disponibilize uma API JSON pública e
crie um aplicativo Flutter que  carregue os dados desta API.

O aplicativo deve ter no mínimo três telas, sendo uma para listar
todos os dados  fornecidos pela API, nesta tela inicial,
listar pelo menos o título do item.

Ao clicar em cima do título da lista, o  aplicativo deve abrir
uma nova tela com os detalhes do item selecionado.

A terceira tela seria uma espécie de Sobre do aplicativo,
deve conter os dados do aluno, incluindo nome completo e
alguma forma de contato.

Para facilitar a codificação e a manutenção, deve-se utilizar
a criação de Widgets

## Alguns exemplos de APIs públicas
➢ Rick and Morty: [https://rickandmortyapi.com/api/character?page=1](https://rickandmortyapi.com/api/character?page=1)
➢ Pokemon: [https://pokeapi.co/api/v2/pokemon?limit=151](https://pokeapi.co/api/v2/pokemon?limit=151)

Nesse trabalho, foi escolhida a segunda API sugerida pelo professor.

## FORMA DE ENTREGA
Enviar o projeto por e-mail ou o link do GIT do projeto e o
nome completo do aluno.

## PRAZO DE ENTREGA
Até o dia 30 de junho enviando por e-mail.
