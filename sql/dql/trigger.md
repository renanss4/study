# Trigger 

Trigger, também conhecido como Gatilho, é um recurso utilizado quando uma ação deve ser executada automaticamente ao inserir, alterar ou excluir registros de uma tabela. Embora poderoso, o uso de triggers deve ser feito com cuidado, pois pode impactar o desempenho do sistema e a manutenibilidade do código.

## Quando usar Triggers:

Triggers são úteis em cenários onde a lógica de negócios precisa ser aplicada automaticamente em resposta a mudanças nos dados da tabela. No entanto, é importante considerar alternativas, como restrições de chave estrangeira ou procedimentos armazenados, dependendo do contexto e da complexidade do problema.

As triggers podem ser aplicadas em diversos casos, tais como:

- Alertar o usuário sobre exceções;
- Realizar auditoria nos dados;
- Medir o desempenho do sistema;
- Rastrear eventos específicos.

## Boas Práticas ao Usar Triggers:

- Mantenha a lógica da trigger simples e direta para facilitar a manutenção.
- Evite ações complexas dentro de triggers, como atualizações em cascata em várias tabelas.
- Documente claramente o propósito e o comportamento da trigger para futuras referências.
- Teste cuidadosamente as triggers para garantir que elas se comportem conforme o esperado em todas as situações.

## Criação de uma Trigger:

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

## Verificação de Valores na Trigger:

- **Valores Antigos:** `OLD.nome_campo`
- **Novos Valores:** `NEW.nome_campo`

## Exemplo de Trigger para Erro ao Deletar:

```sql
CREATE TRIGGER tr_erro BEFORE DELETE ON aluno FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Não é possível apagar um aluno sem idade';
END;
```

## Declaração de variável:

```sql
declare nome_variavel tipo_variavel;
```

## Atribuir valor a variável:

```sql
Set nome_variavel = valor
```

```sql
SELECT 	nome_variavel = campo_tabela
FROM		tabela
WHERE 	condição
```

## Exemplo para criar um erro para o usuário:

```sql
CREATE TRIGGER tr_erro BEFORE DELETE ON aluno FOR EACH ROW
BEGIN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Não é possivel apagar um aluno sem idade';

END!!
DELIMITER ;
```

## Recursos dentro Trigger:

Aqui está uma descrição detalhada de cada recurso dentro de uma trigger em SQL, juntamente com exemplos práticos para cada um:

### IF

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
