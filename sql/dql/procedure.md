# Stored Procedures e Functions

Uma Stored Procedure e Function são um conjunto de comandos SQL que podem ser armazenados no servidor. Uma vez que isto tenha sido feito, os clientes não precisam de reenviar os comandos individuais mas podem fazer referência.

Stored Procedure e Function podem fornecer um aumento no desempenho já que menos informação precisa ser enviada entre o servidor e o cliente. 

O lado negativo é que isto aumenta a carga no sistema do servidor de banco de dados, já que a maior parte do trabalho é feita no servidor e menor parte é feita do lado do cliente.

## Criação de Stored Procedure:

```sql
DELIMITER $$
CREATE PROCEDURE nome_procedure (parametro_1 ,..., OUT parametro_n)
BEGIN 
	-- Corpo da stored procedure aqui
END $$
DELIMITER ;
```

**Exemplo:**

```sql
DELIMITER $$
CREATE PROCEDURE sp_soma (Numero_1 int, Numero_2 int, OUT result int)
BEGIN 
	set result = Numero_1 + Numero_2;
END $$
DELIMITER ;

## Criação de Function:

```sql
DELIMITER $$
CREATE FUNCTION nome_função(parametro_1,...,parametro_n) RETURNS tipo
BEGIN 
	return nome_variavel;
END $$
DELIMITER ;
```

Exemplo:

```sql
DELIMITER $$
CREATE FUNCTION fn_soma (Numero_1 int, Numero_2 int) RETURNS int
BEGIN 
	declare resultado int;
	set resultado = Numero_1 + Numero_2;
	return resultado;
END $$
DELIMITER ;

## Declaração de variável:

```sql
declare nome_variavel tipo_variavel;
```

### Atribuir valor a variável:

```sql
Set nome_variavel = valor;
```

```sql
SELECT nome_variavel = campo_tabela
FROM		tabela
WHERE 	condição;
```

### Alteração de Stored Procedure:

```sql
DELIMITER $$
ALTER PROCEDURE nome_procedure (param_1,..., param_n OUT)
BEGIN 
	-- Corpo da stored procedure aqui
END $$
DELIMITER ;
```

### Alteração de Function:

```sql
DELIMITER $$
ALTER FUNCTION nome_função (param_1,...,param_n) RETURNS tipo
BEGIN 
	return nome_variavel;
END $$
DELIMITER ;
```

### Remoção de Stored Procedure:

```sql
DROP PROCEDURE nome_procedure;
```

### Remoção de Function:

```sql
DROP FUNCTION nome_função;
```

### Visualizar o conteúdo de uma Stored Procedure:

```sql
SHOW CREATE PROCEDURE nome_procedure;
```

### Visualizar o conteúdo de uma Function:

```sql
SHOW CREATE FUNCTION nome_função;
```

### Utilizar uma Stored Procedure:

```sql
CALL nome_procedure (param_1,..., param_n OUT);
```

### Utilizar uma Function:

```sql
SELECT nome_função (param_1,..., param_n);
```

### Exemplo Prático de Stored Procedure:

**Descrição:**
Suponha que em um sistema de gerenciamento de uma loja online, você deseja criar uma stored procedure para calcular o valor total de uma compra, levando em consideração o preço dos itens, a quantidade e o desconto aplicável.

```sql
DELIMITER $$

CREATE PROCEDURE calcular_valor_total(
    IN id_cliente INT,
    OUT total_com_desconto DECIMAL(10, 2)
)
BEGIN
    DECLARE total_sem_desconto DECIMAL(10, 2);
    DECLARE desconto_cliente DECIMAL(5, 2);
    
    -- Calcula o total sem desconto
    SELECT SUM(preco * quantidade) INTO total_sem_desconto
    FROM itens_compra
    WHERE cliente_id = id_cliente;
    
    -- Calcula o desconto do cliente (exemplo hipotético)
    SELECT desconto INTO desconto_cliente
    FROM clientes
    WHERE id = id_cliente;
    
    -- Aplica o desconto ao total
    SET total_com_desconto = total_sem_desconto * (1 - (desconto_cliente / 100));
END $$

DELIMITER ;
```

**Exemplo de Uso:**
```sql
CALL calcular_valor_total(123, @total_com_desconto);
SELECT @total_com_desconto;
```

Neste exemplo, a stored procedure `calcular_valor_total` recebe o ID do cliente como entrada e retorna o valor total da compra após aplicar o desconto correspondente.

### Exemplo Prático de Function:

**Descrição:**
Suponha que em um sistema de gerenciamento de uma loja online, você precise de uma função que retorne o preço total de um item, incluindo impostos e frete, para exibir na página de detalhes do produto.

```sql
DELIMITER $$

CREATE FUNCTION calcular_preco_total(
    preco_unitario DECIMAL(10, 2),
    quantidade INT
) RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE preco_total DECIMAL(10, 2);
    DECLARE taxa_imposto DECIMAL(5, 2);
    DECLARE valor_frete DECIMAL(10, 2);
    
    -- Obtém a taxa de imposto (exemplo hipotético)
    SET taxa_imposto = 0.10;
    
    -- Obtém o valor do frete (exemplo hipotético)
    SET valor_frete = 5.00;
    
    -- Calcula o preço total
    SET preco_total = (preco_unitario * quantidade) * (1 + taxa_imposto) + valor_frete;
    
    RETURN preco_total;
END $$

DELIMITER ;
```

**Exemplo de Uso:**

```sql
SELECT calcular_preco_total(20.00, 3);
```

Neste exemplo, a função `calcular_preco_total` recebe o preço unitário do item e a quantidade desejada como entrada e retorna o preço total do item, considerando o imposto e o valor do frete. Isso pode ser útil para exibir o preço total de um produto em uma página de detalhes do produto.

## Recursos dentro Stored Procedure:

### IF

A declaração `IF` permite que você execute um bloco de código se uma condição especificada for verdadeira ou outro bloco de código se a condição for falsa.

```sql
IF condição THEN
	bloco_codigo
ELSEIF condição THEN
	bloco_codigo
ELSE 
	bloco_codigo
END IF;
```

### WHILE

A declaração `WHILE` permite que você execute repetidamente um bloco de código enquanto uma condição especificada for verdadeira.

```sql
WHILE condicao DO
	bloco_codigo
END WHILE;
```

### CASE

A declaração `CASE` permite que você execute diferentes blocos de código com base no valor de uma variável ou expressão.

```sql
CASE variável
	WHEN valor THEN bloco_codigo
	WHEN valor THEN bloco_codigo
	ELSE bloco_codigo
END CASE;
```

### REPEAT

A declaração `REPEAT` permite que você execute um bloco de código repetidamente até que uma condição especificada seja verdadeira.

```sql
REPEAT
	bloco_codigo
	UNTIL condicao
END REPEAT;
```

### Loop

A declaração `LOOP` permite que você execute um bloco de código repetidamente até que uma condição seja satisfeita. Pode ser utilizado em conjunto com `LEAVE` para sair do loop e `ITERATE` para avançar para a próxima iteração.

```sql
variavel_loop LOOP
	
	bloco_codigo

END LOOP;

Encerra o loop:
LEAVE variavel_loop;

Faz mais uma interação no loop:
ITERATE variavel_loop;
```

### CURSOR

Um cursor é um objeto que permite percorrer os resultados de uma consulta SQL linha por linha.

```sql
DECLARE controle INT DEFAULT 0;

DECLARE nome_cursor CURSOR FOR consulta;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET controle = 1;

OPEN nome_cursor;
FETCH nome_cursor INTO varialvel;

CLOSE nome_cursor;
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
END;
```