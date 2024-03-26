# Stored Procedures e Functions

Uma Stored Procedure e Function são um conjunto de comandos SQL que podem ser armazenados no servidor. Uma vez que isto tenha sido feito, os clientes não precisam de reenviar os comandos individuais mas podem fazer referência.

Stored Procedure e Function podem fornecer um aumento no desempenho já que menos informação precisa ser enviada entre o servidor e o cliente. 

O lado negativo é que isto aumenta a carga no sistema do servidor de banco de dados, já que a maior parte do trabalho é feita no servidor e menor parte é feita do lado do cliente.

## Criação de Stored Procedure:

DELIMITER $$
CREATE PROCEDURE nome_procedure (parametro_1 ,..., OUT parametro_n)
BEGIN 

END $$
DELIMITER ;

Exemplo:

DELIMITER $$
CREATE PROCEDURE sp_soma (Numero_1 int, Numero_2 int, OUT result int)
BEGIN 
	set result = Numero_1 + Numero_2
END $$
DELIMITER ;

## Criação de Function:

DELIMITER $$
CREATE FUNCTION nome_função(parametro_1,...,parametro_n) RETURNS tipo
BEGIN 
	return nome_variavel;
END $$
DELIMITER ;

Exemplo:

DELIMITER $$
CREATE FUNCTION fn_soma (Numero_1 int, Numero_2 int) RETURNS int
BEGIN 
	declare resultado;
	set resultado = Numero_1 + Numero_2
	return resultado;
END $$
DELIMITER ;

## Declaração de variável:

declare nome_variavel tipo_variavel;

## Atribuir valor a variável:

Set nome_variavel = valor

SELECT 	nome_variavel = campo_tabela
FROM		tabela
WHERE 	condição

## Alteração de Stored Procedure:

DELIMITER $$
ALTER PROCEDURE nome_procedure (param_1,..., param_n OUT)
BEGIN 

END $$
DELIMITER ;

## Alteração de Function:

DELIMITER $$

ALTER FUNCTION nome_função (param_1,...,param_n) RETURNS tipo
BEGIN 

	return nome_variavel;

END $$
DELIMITER ;

## Remoção de Stored Procedure:

DROP PROCEDURE nome_procedure;


Remoção de Function:

DROP FUNCTION nome_função;

## Visualizar o conteúdo de uma Stored Procedure:

SHOW CREATE PROCEDURE nome_procedure;


## Visualizar o conteúdo de uma Function:

SHOW CREATE FUNCTION nome_função;

## Utilizar uma Stored Procedure:

CALL nome_procedure (param_1,..., param_n OUT);


## Utilizar uma Function:

SELECT nome_função (param_1,..., param_n);

## Recursos dentro Stored Procedure:

### IF

```sql
IF condição THEN
	bloco_codigo
ELSEIF condição THEN
	bloco_codigo
ELSE 
	bloco_codigo
END IF
```

### WHILE

```sql
WHILE condicao DO
	bloco_codigo
END WHILE
```
### CASE

```sql
CASE variável
	WHEN valor THEN bloco_codigo
	WHEN valor THEN bloco_codigo
	ELSE bloco_codigo
END CASE
```

### REPEAT

```sql
REPEAT
	bloco_codigo
	UNTIL condicao
END REPEAT
```

### Loop

```sql
variavel_loop LOOP
	
	bloco_codigo

END LOOP

Encerra o loop:
LEAVE variavel_loop;

Faz mais uma interação no loop:
ITERATE variavel_loop;
```

### CURSOR

```sql
DECLARE controle INT DEFAULT 0;

DECLARE nome_cursor CURSOR FOR consulta;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET controle = 1;

OPEN nome_cursor 
FETCH nome_cursor INTO varialvel

CLOSE nome_curso;
```

```sql
CREATE PROCEDURE soma_idade(OUT SOMA INT)
BEGIN
	DECLARE done INT DEFAULT 0;
	DECLARE vIdade int;
	DECLARE cur_aluno CURSOR FOR SELECT idade FROM aluno;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
	SET SOMA = 0;
	OPEN cur_aluno;
	FETCH cur_aluno INTO vIdade;
	while not (done = 1) do
		IF vIdade is not null THEN
			set soma = soma + vIdade;
		END IF;
		FETCH cur_aluno INTO vIdade;
	END while;
	CLOSE cur_aluno;
END !!
```

