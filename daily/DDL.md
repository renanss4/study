
# Linguagem de Definição de Dados (DDL)

Inclui comandos para definir, atlerar e remover tabelas e índices.

## Banco de Dados

### Criação de Banco de Dados:

```sql
CREATE DATABASE nome_do_banco_de_dados;
```

### Selecionar o Banco de Dados para criação de tabelas

```sql
USE nome_do_banco_de_dados;
```

### Mostrar as tabelas já criadas

```sql
SHOW TABLES;
```
### Mostrar a estrutura das Tabelas

```sql
DESCRIBE nome_da_tabela;
```

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

- **CHAR(numero_caracteres):** Campo texto limitado, sempre preenchida a direita com espaços;

- **VARCHAR(numero_caracteres):** Campo texto de tamanho variável;

- **INT:** Um inteiro de tamanho normal;

- **FLOAT(precisão):** Um número de ponto flutuante pequeno;

- **DOUBLE(tamanho, precisão):** Um número de ponto flutuante de tamanho normal;

- **DECIMAL(tamanho, precisão):** Um número de ponto flutuante de tamanho normal com tamanho fixo;

- **DATE:** Tipo para data, no formato AAAA-MM-DD;

- **TIME:** Uma para hora, no formato HH:NN:SS;

- **DATETIME:** Um combinação de hora e data separado por espaço, no formato AAAA-MM-DD HH:NN:SS;

- **TIMESTAMP:** Um combinação de hora e data separado por espaço, no formato AAAA-MM-DD HH:NN:SS;

- **ENUM('valor1', 'valor2', ..., valorN):** Uma enumeração. Um valor do tipo texto ou número inteiro;

- **BLOB:** Um campo para imagem ou texto muito grande com tamanho máximo de 4294967295 ou 4G.

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

#### **ZEROFILL:** Preenche espaços vazios da coluna com o número zero.

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

**Simples:** É formada por apenas um campo da tabela;

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

Caso o campo seja utilizado em um indice ou chave, não será permitido a remoção;

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

Adicionar uma chave estrangeira em um campo já existente

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

> **Caso a tabela seja utilizada em um relacionamento, não será permitido a remoção!**

---