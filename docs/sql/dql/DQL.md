# Linguagem de Consulta de Dados (DQL)

A Linguagem de Consulta de Dados (DQL) inclui comandos para recuperar dados de um banco de dados. O principal objetivo da DQL é permitir que os usuários realizem consultas para recuperar informações específicas armazenadas no banco de dados.

Exemplo de comando DQL em SQL:

- **SELECT**: Para consultar e recuperar dados específicos de uma ou mais tabelas, com base em critérios definidos pelo usuário.

## Produto Cartesiano

O produto cartesiano é um conceito fundamental na matemática que surge da combinação de elementos de dois conjuntos distintos. Ao tomar dois conjuntos, denotados como X e Y, o produto cartesiano desses conjuntos é o conjunto de todos os pares ordenados, onde o primeiro elemento pertence a X e o segundo pertence a Y.

**Exemplo:**

Seja o conjunto X = {A, B, C, D} e o conjunto Y = {1, 2, 3}.

O produto cartesiano de X e Y, representado como X * Y, seria:

```
X * Y = {
    (A, 1), (A, 2), (A, 3),
    (B, 1), (B, 2), (B, 3),
    (C, 1), (C, 2), (C, 3),
    (D, 1), (D, 2), (D, 3),
}
```

Essencialmente, cada elemento de X é combinado com cada elemento de Y para formar todos os possíveis pares ordenados.

![CARTESIANO1](./imgs/CARTESIANO1.png)

### Exemplo em SQL

No contexto de bancos de dados, o produto cartesiano é frequentemente usado em consultas SQL para combinar todas as linhas de duas tabelas.

```sql
SELECT * FROM veiculo, marca;
```

Neste exemplo, a consulta SQL retorna todas as combinações possíveis de linhas das tabelas "veiculo" e "marca".

- **Colunas resultantes:** 5 colunas da tabela "veiculo" + 3 colunas da tabela "marca" = 8 colunas no total.
- **Linhas resultantes:** Como há 6 linhas na tabela "veiculo" e 2 linhas na tabela "marca", o produto cartesiano resulta em 12 linhas.

![CARTESIANO2](./imgs/CARTESIANO2.png)

## Consultas Joins

Em bancos de dados relacionais, a relação entre tabelas é fundamental para a existência e a utilidade dos dados. Por isso, muitas vezes é necessário acessar informações através da junção de tabelas.

Os relacionamentos entre tabelas são estabelecidos através de chaves estrangeiras (FK).

## Junções vs Produto Cartesiano

Embora para muitos, junções e produto cartesiano possam parecer a mesma coisa, existe uma distinção importante entre eles. O produto cartesiano é caracterizado pela combinação de duas ou mais tabelas, trazendo todas as possíveis combinações entre elas. Isso inclui informações verdadeiras e falsas.

Por outro lado, as junções propriamente ditas trazem apenas as informações verdadeiras. Isso é possível graças à condição de junção, que é especificada na cláusula WHERE ou na cláusula ON em consultas SQL. Essa condição de junção é sempre baseada em chaves estrangeiras.

Na prática, as junções fornecem resultados mais precisos e relevantes, filtrando apenas as combinações que atendem às condições estabelecidas, enquanto o produto cartesiano pode gerar um grande número de combinações, incluindo muitas que podem não ser úteis ou significativas para a consulta em questão.

![JUNCAO1](./imgs/JUNCAO1.png)

![SQL_JOINS](./imgs/SQL_JOINS.png)

Quando precisamos acessar informações de duas tabelas relacionadas em SQL, utilizamos recursos como junção (JOIN) ou produto cartesiano.

Uma junção de tabelas cria uma pseudo-tabela derivada de duas ou mais tabelas, seguindo regras especificadas, que são semelhantes às regras da teoria dos conjuntos.

> **Atenção:** É importante ressaltar que ao realizar uma junção, geralmente preferimos unir duas tabelas com base nos campos que são chaves estrangeiras (Foreign Key) existentes entre elas. Isso garante uma relação direta e significativa entre os dados das tabelas envolvidas.

![MODELOS_JOIN](./imgs/MODELOS_JOIN.png)

```sql
CREATE TABLE DEPARTAMENTO (
    IDDEPARTAMENTO INT NOT NULL PRIMARY KEY,
    NOME VARCHAR(100)
);

CREATE TABLE FUNCIONARIO (
    IDFUNCIONARIO INT NOT NULL PRIMARY KEY,
    IDDEPARTAMENTO INT NOT NULL,
    NOME VARCHAR(100),
    FOREIGN KEY (IDDEPARTAMENTO) REFERENCES DEPARTAMENTO (IDDEPARTAMENTO)
);
```

![EXEMPLO_JOIN](./imgs/EXEMPLO_JOIN.png)

## Inner Join

As junções INNER JOIN se caracterizam por uma seleção que retorna apenas os dados que atendem à condição de junção. Isso significa que apenas os registros que possuem correspondência nas duas tabelas envolvidas serão incluídos no resultado.

![INNER_JOIN](./imgs/INNER_JOIN.png)

### Exemplo

Considere dois conjuntos A e B:

```
A = {2, 4, 6}
B = {4, 6, 8}
```

O produto cartesiano de A e B seria:

```
A * B = {
    (2,4), (2,6), (2,8),
    (4,4), (4,6), (4,8),
    (6,4), (6,6), (6,8)
}
```

No entanto, ao aplicarmos um INNER JOIN entre A e B, apenas os registros que têm correspondência em ambos os conjuntos são retornados:

```
A INNER JOIN B = {(4,4), (6,6)}
```

Apenas os pares onde o primeiro elemento está em A e o segundo elemento está em B são incluídos no resultado, conforme a condição de junção estabelecida.

![EXEMPLO_INNER_JOIN](./imgs/EXEMPLO_INNER_JOIN.png)
### Consulta SQL e Criação de Tabelas

#### Criação das Tabelas

```sql
CREATE TABLE DEPARTAMENTO (
  IDDEPARTAMENTO INT NOT NULL PRIMARY KEY,
  NOME VARCHAR(100)
);

CREATE TABLE FUNCIONARIO (
  IDFUNCIONARIO INT NOT NULL PRIMARY KEY,
  IDDEPARTAMENTO INT NOT NULL,
  NOME VARCHAR(100),
  FOREIGN KEY (IDDEPARTAMENTO) REFERENCES DEPARTAMENTO (IDDEPARTAMENTO)
);
```

#### Consulta com Inner Join

```sql
SELECT	
  DEPARTAMENTO.IDDEPARTAMENTO,
  DEPARTAMENTO.NOME,
  FUNCIONARIO.IDFUNCIONARIO,
  FUNCIONARIO.NOME
FROM
  DEPARTAMENTO
  INNER JOIN FUNCIONARIO ON
  DEPARTAMENTO.IDDEPARTAMENTO = FUNCIONARIO.IDDEPARTAMENTO;
```

### Resultado da Consulta

![EXEMPLO_INNER_JOIN2](./imgs/EXEMPLO_INNER_JOIN2.png)

## Left Join

As junções externas LEFT JOIN se caracterizam por uma seleção que retorna todos os dados da tabela da ESQUERDA (left) e apenas os dados que atendem à condição de junção da tabela da DIREITA.

![LEFT_JOIN](./imgs/LEFT_JOIN.png)

### Exemplo e Consulta

Considerando os conjuntos A e B:

```
A = {2, 4, 6}
B = {4, 6, 8}
```

O produto cartesiano de A e B seria:

```
A * B = {(2,4), (2,6), (2,8), (4,4), (4,6), (4,8), (6,4), (6,6), (6,8)}
```

Ao aplicar um LEFT JOIN entre A e B, temos:

```
A LEFT JOIN B = {(2,null), (4,4), (6,6)}
```

Isso significa que todos os elementos de A são mantidos no resultado, enquanto apenas os elementos de B que têm correspondência com A são incluídos, marcados com `null` nos casos em que não há correspondência.

### Consulta SQL e Criação de Tabelas

```sql
-- Criando as tabelas
CREATE TABLE DEPARTAMENTO (
  IDDEPARTAMENTO INT NOT NULL PRIMARY KEY,
  NOME VARCHAR(100)
);

CREATE TABLE FUNCIONARIO (
  IDFUNCIONARIO INT NOT NULL PRIMARY KEY,
  IDDEPARTAMENTO INT NOT NULL,
  NOME VARCHAR(100),
  FOREIGN KEY (IDDEPARTAMENTO) REFERENCES DEPARTAMENTO (IDDEPARTAMENTO)
);

-- Consulta com Left Join
SELECT	
  DEPARTAMENTO.IDDEPARTAMENTO,
  DEPARTAMENTO.NOME,
  FUNCIONARIO.IDFUNCIONARIO,
  FUNCIONARIO.NOME
FROM
  DEPARTAMENTO
  LEFT JOIN FUNCIONARIO ON
  DEPARTAMENTO.IDDEPARTAMENTO = FUNCIONARIO.IDDEPARTAMENTO;
```

## Right Join

As junções externas RIGHT OUTER JOIN se caracterizam por uma seleção que retorna todos os dados da tabela da DIREITA (right) e apenas os dados que atendem à condição de junção da tabela da ESQUERDA.

![RIGHT_JOIN](./imgs/RIGHT_JOIN.png)

### Exemplo e Consulta

Considerando os conjuntos A e B:

```
A = {2, 4, 6}
B = {4, 6, 8}
```

O produto cartesiano de A e B seria:

```
A * B = {(2,4), (2,6), (2,8), (4,4), (4,6), (4,8), (6,4), (6,6), (6,8)}
```

Ao aplicar um RIGHT JOIN entre A e B, temos:

```
A RIGHT JOIN B = {(4,4), (6,6), (null,8)}
```

Isso significa que todos os elementos de B são mantidos no resultado, enquanto apenas os elementos de A que têm correspondência com B são incluídos, marcados com `null` nos casos em que não há correspondência.

### Consulta SQL e Criação de Tabelas

```sql
-- Criando as tabelas 
CREATE TABLE DEPARTAMENTO (
  IDDEPARTAMENTO INT NOT NULL PRIMARY KEY,
  NOME VARCHAR(100)
);

CREATE TABLE FUNCIONARIO (
  IDFUNCIONARIO INT NOT NULL PRIMARY KEY,
  IDDEPARTAMENTO INT NOT NULL,
  NOME VARCHAR(100),
  FOREIGN KEY (IDDEPARTAMENTO) REFERENCES DEPARTAMENTO (IDDEPARTAMENTO)
);

-- Consulta com Right Join
SELECT	
  DEPARTAMENTO.IDDEPARTAMENTO,
  DEPARTAMENTO.NOME,
  FUNCIONARIO.IDFUNCIONARIO,
  FUNCIONARIO.NOME
FROM
  DEPARTAMENTO
  RIGHT JOIN FUNCIONARIO ON
  DEPARTAMENTO.IDDEPARTAMENTO = FUNCIONARIO.IDDEPARTAMENTO;
```

## Trigger 

Trigger, também conhecido como Gatilho, é um recurso utilizado quando uma ação deve ser executada automaticamente ao inserir, alterar ou excluir registros de uma tabela. Embora poderoso, o uso de triggers deve ser feito com cuidado, pois pode impactar o desempenho do sistema e a manutenibilidade do código.

### Quando usar Triggers:

Triggers são úteis em cenários onde a lógica de negócios precisa ser aplicada automaticamente em resposta a mudanças nos dados da tabela. No entanto, é importante considerar alternativas, como restrições de chave estrangeira ou procedimentos armazenados, dependendo do contexto e da complexidade do problema.

As triggers podem ser aplicadas em diversos casos, tais como:

- Alertar o usuário sobre exceções;
- Realizar auditoria nos dados;
- Medir o desempenho do sistema;
- Rastrear eventos específicos.

### Boas Práticas ao Usar Triggers:

- Mantenha a lógica da trigger simples e direta para facilitar a manutenção.
- Evite ações complexas dentro de triggers, como atualizações em cascata em várias tabelas.
- Documente claramente o propósito e o comportamento da trigger para futuras referências.
- Teste cuidadosamente as triggers para garantir que elas se comportem conforme o esperado em todas as situações.

### Criação de uma Trigger:

```sql
DELIMITER $$
CREATE TRIGGER nome_trigger MOMENTO ON nome_tabela FOR EACH ROW
BEGIN 
    -- Lógica da trigger aqui
END $$
DELIMITER ;
```

**Momentos Disponíveis:**

- BEFORE INSERT
- AFTER INSERT
- BEFORE UPDATE
- AFTER UPDATE
- BEFORE DELETE
- AFTER DELETE

### Verificação de Valores na Trigger:

- **Valores Antigos:** `OLD.nome_campo`
- **Novos Valores:** `NEW.nome_campo`

### Exemplo de Trigger para Erro ao Deletar:

```sql
CREATE TRIGGER tr_erro BEFORE DELETE ON aluno FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Não é possível apagar um aluno sem idade';
END;
```

### Declaração de variável:
```sql
declare nome_variavel tipo_variavel;
```

### Atribuir valor a variável:
```sql
Set nome_variavel = valor
```

```sql
SELECT 	nome_variavel = campo_tabela
FROM		tabela
WHERE 	condição
```

### Exemplo para criar um erro para o usuário:

```sql
CREATE TRIGGER tr_erro BEFORE DELETE ON aluno FOR EACH ROW
BEGIN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Não é possivel apagar um aluno sem idade';

END!!
DELIMITER ;
```

### Recursos dentro Trigger:

Aqui está uma descrição detalhada de cada recurso dentro de uma trigger em SQL, juntamente com exemplos práticos para cada um:

#### IF

O comando `IF` é usado para executar uma ação com base em uma condição específica. Ele pode ser usado sozinho ou em conjunto com `ELSEIF` e `ELSE` para lidar com múltiplas condições.

Exemplo:

```sql
IF saldo < 0 THEN
    UPDATE contas SET status = 'inadimplente' WHERE id_conta = id_conta_param;
ELSEIF saldo > 1000 THEN
    INSERT INTO historico (id_conta, descricao) VALUES (id_conta_param, 'Saldo alto');
ELSE
    INSERT INTO historico (id_conta, descricao) VALUES (id_conta_param, 'Saldo normal');
END IF;
```

### WHILE

O comando `WHILE` é usado para executar um bloco de código repetidamente enquanto uma condição específica for verdadeira.

Exemplo:

```sql
WHILE contador < 10 DO
    INSERT INTO registros (valor) VALUES (contador);
    SET contador = contador + 1;
END WHILE;
```

### CASE

A declaração `CASE` é usada para executar diferentes ações com base no valor de uma variável ou expressão.

Exemplo:

```sql
CASE tipo_conta
    WHEN 'corrente' THEN
        UPDATE contas SET taxa_mensal = 10 WHERE id_conta = id_conta_param;
    WHEN 'poupança' THEN
        UPDATE contas SET taxa_mensal = 5 WHERE id_conta = id_conta_param;
    ELSE
        UPDATE contas SET taxa_mensal = 0 WHERE id_conta = id_conta_param;
END CASE;
```

### REPEAT

O comando `REPEAT` é usado para executar um bloco de código até que uma condição específica seja atendida.

Exemplo:

```sql
REPEAT
    SET contador = contador + 1;
    INSERT INTO logs (mensagem) VALUES ('Iteração ' + contador);
UNTIL contador >= 10
END REPEAT;
```

### LOOP, LEAVE, ITERATE

O `LOOP` é usado para criar um loop infinito, enquanto `LEAVE` é usado para sair do loop e `ITERATE` é usado para continuar para a próxima iteração.

Exemplo:

```sql
DECLARE contador INT DEFAULT 0;

loop_principal: LOOP
    IF contador >= 10 THEN
        LEAVE loop_principal;
    END IF;
    
    IF contador = 5 THEN
        ITERATE loop_principal;
    END IF;
    
    INSERT INTO registros (valor) VALUES (contador);
    SET contador = contador + 1;
END LOOP loop_principal;
```

### CURSOR

Um cursor é uma estrutura de controle utilizada para percorrer os registros de um conjunto de resultados. É útil quando se quer manipular cada linha de um resultado individualmente.

Exemplo:

```sql
DECLARE done INT DEFAULT 0;
DECLARE vIdade INT;
DECLARE cur_aluno CURSOR FOR SELECT idade FROM aluno;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

OPEN cur_aluno;
FETCH cur_aluno INTO vIdade;

WHILE done = 0 DO
    -- Realiza operações com vIdade aqui
    FETCH cur_aluno INTO vIdade;
END WHILE;

CLOSE cur_aluno;
```
