# Linguagem de Definição de Dados (DDL)

A Linguagem de Definição de Dados (DDL) inclui comandos para definir, alterar e remover a estrutura dos objetos de banco de dados, como tabelas, índices, visões e restrições. Esses comandos permitem aos usuários definir a estrutura dos dados que serão armazenados no banco de dados.

Exemplos de comandos DDL em SQL incluem:

- **CREATE`**: Para criar novos objetos de banco de dados, como tabelas, índices e visões.
- **ALTER**: Para modificar a estrutura de objetos existentes no banco de dados, como adicionar, modificar ou excluir colunas de uma tabela.
- **DROP**: Para remover objetos de banco de dados, como tabelas, índices e visões.

## Banco de Dados

### Criação de Banco de Dados:

```sql
CREATE DATABASE nome_do_banco_de_dados;
```

### Selecionar o Banco de Dados para criação de tabelas

```sql
USE nome_do_banco_de_dados;
```

![USE_DB](./imgs/USE_DB.png)

### Mostrar as tabelas já criadas

```sql
SHOW TABLES;
```

![SHOW_TABLES](./imgs/SHOW_TABLES.png)

### Mostrar a estrutura das Tabelas

```sql
DESCRIBE nome_da_tabela;
```

![DESCRIBE_TABLE](./imgs/DESCRIBE_TABLE.png)

## Tabelas

### Criação de Tabelas - Campos

```sql
CREATE TABLE nome_da_tabela (
    nome_campo1 tipo_campo opcoes_campo,
    nome_campo2 tipo_campo opcoes_campo,
    nome_campo_n tipo_campo opcoes_campo
);
```

## Domínio ou Tipo de Dados - MySQL

Aqui está a tabela com os tipos de dados e suas descrições:

| Tipo de Dado | Descrição                                           |
|--------------|-----------------------------------------------------|
| **CHAR(n)**      | Campo texto limitado, sempre preenchido à direita com espaços, com tamanho fixo n. |
| **VARCHAR(n)**   | Campo texto de tamanho variável, com tamanho máximo n. |
| **INT**          | Inteiro de tamanho normal.                           |
| **FLOAT(p)**     | Número de ponto flutuante pequeno, com precisão p.   |
| **DOUBLE(n, p)** | Número de ponto flutuante de tamanho normal, com precisão n e p. |
| **DECIMAL(n, p)**| Número de ponto flutuante de tamanho normal com tamanho fixo, com precisão n e p. |
| **DATE**         | Tipo de dado para armazenar datas no formato AAAA-MM-DD. |
| **TIME**         | Tipo de dado para armazenar horas no formato HH:NN:SS. |
| **DATETIME**     | Combinação de data e hora no formato AAAA-MM-DD HH:NN:SS. |
| **TIMESTAMP**    | Combinação de data e hora no formato AAAA-MM-DD HH:NN:SS. |
| **ENUM('val1', 'val2', ..., 'valN')** | Enumeração de valores, aceitando um valor do tipo texto ou número inteiro. |
| **BLOB**         | Campo para armazenar imagem ou texto muito grande, com tamanho máximo de 4294967295 ou 4GB. |

## Integridade de dados a nível de campo ou atributo

### **NOT NULL:** Não permissão a inclusão de valores nulos, torna o campo obrigatório.

```sql
CREATE TABLE nome_da_tabela (
    nome_campo tipo_campo NOT NULL
);
```

***Exemplo:***

```sql
CREATE TABLE aluno (
    nome varchar(100) NOT NULL
);
```

### **AUTO_INCREMENT:** Gera um numero incremental a cada novo registro.

```sql
CREATE TABLE nome_da_tabela (
    nome_campo tipo_campo AUTO_INCREMENT
);
```

***Exemplo:***

```sql
CREATE TABLE aluno (
    codigo int AUTO_INCREMENT
);
```

### **UNSIGNED:** Usado para permitir somente valores positivos.

```sql
CREATE TABLE nome_da_tabela (
    nome_campo tipo_campo UNSIGNED
);
```

***Exemplo:***

```sql
CREATE TABLE pessoa (
    idade int UNSIGNED
);
```

### **UNIQUE:** Garante a unicidade do valor de um campo na tabela.
    
```sql
CREATE TABLE nome_da_tabela (
    nome_campo tipo_campo UNIQUE
);
```

***Exemplo:***

```sql
CREATE TABLE pessoa (
    cpf char(11) UNIQUE
);
```

### **DEFAULT(valor):** Valores assumidos em uma inserção caso não houver indicação explícita.

```sql
CREATE TABLE nome_da_tabela (
    nome_campo tipo_campo DEFAULT (valor)
);
```

***Exemplo:***

```sql
CREATE TABLE aluno (
    dt_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### **ZEROFILL:** Preenche espaços vazios da coluna com o número zero.

```sql
CREATE TABLE nome_da_tabela (
    nome_campo tipo_campo ZEROFILL
);
```

***Exemplo:***

```sql
CREATE TABLE conta(
    taxa int ZEROFILL
);
```

## Chaves primárias

Temos dois tipos de chaves primárias:

**Simples:** É formada por apenas um campo da tabela.

**Composta:** Composta por dois ou mais campos da tabela.

### Chaves primárias Simples

```sql
CREATE TABLE nome_da_tabela (
    nome_campo tipo_campo PRIMARY KEY
);
```

```sql
CREATE TABLE nome_da_tabela (
    nome_campo tipo_campo ,
    
    PRIMARY KEY (nome_campo)
);
```

***Exemplo:***

```sql
CREATE TABLE aluno (
    codigo int PRIMARY KEY
);
```

```sql
CREATE TABLE aluno (
    codigo int,
    
    PRIMARY KEY (codigo)
);
```

### Chaves primárias Composta

```sql
CREATE TABLE nome_da_tabela (
    nome_campo tipo_campo ,
    
    PRIMARY KEY (nome_campo)
);
```

***Exemplo:***

```sql
CREATE TABLE itens_pedido (
    cod_pedido int,
    cod_produto int,
    
    PRIMARY KEY (cod_pedido,cod_produto)
);
```

### Chaves Estrangeira

```sql
CREATE TABLE nome_da_tabela (
    nome_campo tipo_campo ,
    
    FOREIGN KEY (nome_campo)
    REFERENCES nome_tabela_relacionada (nome_campo_relacionado)
);
```

***Exemplo:***

```sql
CREATE TABLE funcionario (
    departamento int,

    FOREIGN KEY (departamento) REFERENCES departamento (codigo)
);
```

## Alteração em Tabelas já criadas

### Adicionar um novo campo em uma tabela

```sql
ALTER TABLE nome_tabela 
ADD COLUMN nome_campo tipo_atributo;
```

***Exemplo:***

```sql
ALTER TABLE aluno 
ADD COLUMN endereco varchar(75) not null;
```

## Remover um campo em uma tabela 

> **Atenção removendo esse campo, será excluído todos os dados contido neste campo, para todos os registros.**

```sql
ALTER TABLE nome_tabela 
DROP COLUMN nome_campo;
```
***Exemplo:***

```sql
ALTER TABLE aluno 
DROP COLUMN endereco;
```

Caso o campo seja utilizado em um índice ou chave, não será permitido a remoção.

## Adicionar uma chave primária em um campo já existente

```sql
ALTER TABLE nome_tabela 
ADD PRIMARY KEY (nome_campo);
```

***Exemplo:***

```sql
ALTER TABLE aluno 
ADD PRIMARY KEY (aluno);
```

Adicionar uma chave estrangeira em um campo já existente.

```sql
ALTER TABLE nome_tabela 
ADD FOREIGN KEY (nome_campo) REFERENCES nome_tabela (nome_campo);
```

***Exemplo:***

```sql
ALTER TABLE funcionario
ADD FOREIGN KEY (departamentocod) REFERENCES departamento (codigo);
```

## Remoção de Tabelas já criadas

> **Atenção removendo uma tabela, será excluído todos os dados contido!**

```sql
DROP TABLE nome_tabela;
```

***Exemplo:***

```sql
DROP TABLE aluno;
```

Caso a tabela seja utilizada em um relacionamento, não será permitido a remoção!
