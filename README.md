# SQL - Study

SQL (Structured Query Language) é uma linguagem de programação utilizada para gerenciar e manipular bancos de dados relacionais. É amplamente empregada para realizar consultas, inserções, atualizações e exclusões de dados em um banco de dados, além de ser utilizada para definir e modificar a estrutura das tabelas e relacionamentos dentro do banco de dados.

## Como instalar?

> Para usuários de Linux!
>
> Eu considero o DB MySQL o melhor para aprendizado, então seguirei com ele para esse estudo.

1. Atualizar pacotes

```bash
sudo apt update && sudo apt upgrade -y
```

2. Instalar o MySQL Server

```bash
sudo apt install mysql-server
```

3. Verificar status do MySQL

```bash
sudo systemctl status mysql
```

4. Iniciar, Parar e Reiniciar o MySQL (Opcional)

    - Para iniciar o MySQL

    ```bash
    sudo systemctl start mysql
    ```

    - Para parar o MySQL

    ```bash
    sudo systemctl stop mysql
    ```

    - Para reiniciar o MySQL

    ```bash
    sudo systemctl restart mysql
    ```

5. Acessar o MySQL

```bash
sudo mysql -u root -p
```

## Funcionalidades principais:

- **[DDL:](docs/DDL.md)** Linguagem de Definição de Dados;

- **[DML:](docs/DML.md)** Linguagem de Manipulação de Dados;

- **[DQL:](docs/DQL.md)** Linguagem de Consulta de Dados;

- **[DCL:](docs/DCL.md)** Linguagem de Controle de Dados;

- **[DTL:](docs/DTL.md)** Linguagem de Transação de Dados.

---

## Um pouco de história - Modelagem de Dados

Um modelo de dados é uma descrição dos tipos de informações que estão armazenadas em um banco de dados.

Dentre as técnicas utilizadas para construção dos modelos utiliza-se “linguagem de modelagem de dados”, que podem ser gráficas ou textuais.

A técnica de modelagem de dados mais difundida e utilizada é a abordagem entidade-relacionamento (ER). Nesta técnica, o modelo de dados é representado através de um modelo entidade-relacionamento (MER). Usualmente, um MER é representado graficamente, através de um diagrama entidade-relacionamento (DER). 

A abordagem ER foi criada em 1976 por Peter Chen. Ela pode ser considerada como um padrão de fato para modelagem conceitual.

Mesmo as técnicas de modelagem orientada a objetos que têm surgido nos últimos anos baseiam-se nos conceitos da abordagem ER.

A maior dificuldade para o aprendizado das técnicas de modelagem em banco de dados é entender um problema do mundo real e converte-lo, criando uma solução.

O profissional da área de informática precisa entender o problema e conceituar o que será a solução e, para isso, duas coisas podem ser consideradas imprescindíveis: 

Saber ouvir o cliente/usuário abstraindo da conversa o que é realmente útil para implementar a solução;

Conhecer as técnicas de modelagem a fim de representar o problema de forma conceitual antes de iniciar a implementação.

![PROJETO_BANCO_DE_DADOS](./docs/imgs/PROJETO_BANCO_DE_DADOS.png)

SGBD (Sistema de Gerenciamento de Banco de Dados) é um software que gerencia o armazenamento, organização e acesso a dados. Exemplos incluem MySQL, Oracle Database, Microsoft SQL Server, PostgreSQL e MongoDB.

### Resumo

Um Banco de Dados contém Tabelas;

A Tabela é a estrutura interna de um Banco de Dados, essa estrutura contém Dados;

Uma Tabela é formada por Linhas e Colunas;

Cada Coluna é referente a uma Categoria de Dados de uma Tabela, também pode ser denominado Campo; 

Um Linha é denominado como Registro e contém todos os dados sobre um objeto a qual é representado pela Tabela.

### DER e Notações

- Notação de Peter Pin-Shan Chen (modelo conceitual)

- Notação de Carlos Alberto Hauser (modelo conceitual)

- Notação de James Martin (modelo físico)

- Notação de Charles Willian Bachman (modelo físico)

## Modelagem Conceitual

![CONCEITOS_SIMBOLOS](./docs/imgs/CONCEITOS_SIMBOLOS.png)

### Entidade

Uma entidade representa, no modelo conceitual, um conjunto de objetos da realidade modelada.

![ENTIDADE](./docs/imgs/ENTIDADE.png)

### Atributo

Atributo é igual ao espaço reservado para receber dado a cada ocorrência de uma entidade ou de um relacionamento. Cada atributo representam a informação associada.

![ATRIBUTO](./docs/imgs/ATRIBUTO.png)

### Identificador

Cada entidade deve possuir um identificador. Um identificador é um conjunto de um ou mais atributos cujos valores servem para distinguir uma ocorrência da entidade das demais ocorrências da mesma entidade.

![IDENTIFICADOR](./docs/imgs/IDENTIFICADOR.png)

### Atributo com Cardinalidade

A cardinalidade de um atributo define quantos valores deste atributo podem estar associados a uma ocorrência da entidade/relacionamento a qual ele pertence Esse atributo é representado por um par de valor, no qual o primeiro valor é a cardinalidade mínima e o segundo valor a cardinalidade máxima. Temos o atributo opcional quando a cardinalidade mínima é 0 (Zero) e/ou atributo multivalorado quando a cardinalidade máxima é N.

![ATRIBUTO_CARDINALIDADE](./docs/imgs/ATRIBUTO_CARDINALIDADE.png)

### Atributo Composto

O atributo composto é formado por um atributo base que da nome ao atributo, seguido dos atributos que fazem parte da sua composição. O numero máximo de níveis é 1 (um), ou seja, não é correto criar um atributo composto por outro atributo composto.

![ATRIBUTO_COMPOSTO](./docs/imgs/ATRIBUTO_COMPOSTO.png)

## Modelage Lógica/Física

O modelo lógico é o resultado ou produto da conversão de um modelo conceitual para um determinado tipo de banco de dados, ou seja, nível de abstração visto pelo usuário do sistema gerenciador de banco de dados.

O modelo físico é o resultado ou produto da conversão de um modelo lógico para um modelo direcionado a um SGDB específico, ou seja uma representação do modelo de acordo com as características do SGDB escolhido.

![CONCEITUAL_LOGICO](./docs/imgs/CONCEITUAL_LOGICO.png)

![ENTIDADE_ATRIBUTO](./docs/imgs/ENTIDADE_ATRIBUTO.png)

### Atributo com Identificador

No modelo lógico o atributo identificador é identificado como a Chave primária da tabela (entidade). É representando do símbolo de uma chave dourada na frente do nome do atributo, ou também pode ser indicado pelo prefixo “PK”.

![ATRIBUTO_IDENTIFICADOR](./docs/imgs/ATRIBUTO_IDENTIFICADOR.png)

### Atributo com Cardinalidade

Os atributos com cardinalidade, sejam eles opcionais ou multivalorados, são adicionados na entidade conforme a quantidade expressa na cardinalidade máxima. Também existe a possibilidade de criar uma outra tabela para adicionar esse atributo.

![ATRIBUTO_CARDINALIDADE_2](./docs/imgs/ATRIBUTO_CARDINALIDADE_2.png)

### Atributo Composto

No modelo conceitual apenas os atributos que fazem parte da composição aparecem dentro da entidade. O atributo base é Também existe a possibilidade de criar uma outra tabela para adicionar esse atributo, nesse caso o atributo base é utilizado para nomear a entidade.

![ATRIBUTO_COMPOSTO_2](./docs/imgs/ATRIBUTO_COMPOSTO_2.png)