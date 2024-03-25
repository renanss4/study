# 10 Steps to Conceptual Data Modeling

![MAGAZINE](../imgs/DOC_IMAGES/10_STEPS/MAGAZINE.png)

Baseado no Artigo SQL Magazine 16 - 10 passos para a criação de um modelo conceitual de banco de banco de dados.

Antes de iniciar as considerações sobre nosso processo de elaboração do modelo conceitual é necessário termos conhecimento do seguinte:

**Substantivos** que designam alguém (fornecedor, cliente, funcionário, aluno), documentos (nota fiscal, pedido, conta corrente, estoque) ou ainda coisas (peça, produto) representam objetos do mundo real que podem vir a fazer parte do modelo conceitual. 

**Verbos** e **preposições** por sua vez servem para que identifiquemos o relacionamento entre as entidades, pois demonstram as ligações existentes entre elas. Por exemplo, quando lemos em um texto a frase “Listar empregados por departamento” concluímos que a entidade “empregado” tem um tipo de relacionamento que podemos chamar de “trabalha no” com a entidade departamento.

Vale ressaltar aqui que nem todos os objetos citados nos requisitos farão parte do modelo e para separá-los podemos utilizar algumas regras simples das quais falaremos abaixo.

## Passo 1

Identificando todos os substantivos que designem objetos

## Passo 2:

Descartando substantivos que como entidade teriam apenas uma ocorrência

Pergunta: **Se esse substantivo for transformado em entidade será um conjunto de apenas uma ocorrência?**

## Passo 3:

Descartando substantivos que servem apenas para entendimento do problema

Pergunta: **Preciso guardar informações sobre esse objeto?**

## Passo 4:

Descartando objetos que são referência a uma futura aplicação

## Passo 5:

Descartando substantivos que se transformados em entidade teriam apenas um atributo

Pergunta: **Se essa entidade vier a ser uma tabela, quantas colunas teria?**

## Passo 6:

Listando os substantivos que se tornarão entidades

## Passo 7:

Identificando os relacionamentos físicos e definindo seus tipos através de verbos ou preposições que demonstrem relações de dependência ou existência entre as entidades

## Passo 8:

Estabelecendo o grau de relacionamento entre as entidades

![10STEPS_RELACIONAMENTO](../imgs/DOC_IMAGES/TIPOS_RELACAO.png)

## Passo 9:

Estabelecendo a razão da cardinalidade do relacionamento entre as entidades

![MODO_LEITURA](../imgs/DOC_IMAGES/CARDINALIDADE_REPRESENTACAO_2.png)

## Passo 10:

Identificando os atributos de cada entidade
