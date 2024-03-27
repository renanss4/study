# MySQL Functions

## Funções String

| Função    | Descrição                                          |
|-----------|----------------------------------------------------|
| ASCII     | Retorna o código ASCII de um valor                |
| CHAR      | Retorna uma String com o valor informado          |
| CONCAT    | Concatena os valores informados                   |
| INSTR     | Retorna a posição inicial de uma SubString        |
| LCASE     | Converte uma String em letras minúsculas          |
| UCASE     | Converte uma String em letras maiúsculas          |
| LEFT      | Retorna os caracteres à esquerda da String        |
| RIGHT     | Retorna os caracteres à direita da String         |
| LOCATE    | Retorna a posição de uma SubString                |
| LTRIM     | Retorna uma string sem espaços à esquerda         |
| RTRIM     | Retorna uma string sem espaços à direita          |
| SUBSTRING | Retorna uma substring de uma string               |
| REPLACE   | Substitui uma substring em uma string             |
| TRIM      | Retira os espaços da esquerda e da direita       |
| LENGTH    | Retorna o tamanho de uma string                   |
| REVERSE   | Retorna uma string invertida                      |

### ASCII(str)

Retorna o valor do código ASCII do primeiro caractere da string "str". Retorna 0 se "str" é uma string vazia.

```sql
SELECT ASCII('A');

-- O código ASCII do caractere 'A' é 65
```

### CHAR(N,...)

CHAR() interpreta os argumentos como inteiros e retorna uma string com caracteres correspondentes aos valores ASCII desses inteiros. Valores NULL são desconsiderados.

```sql
SELECT CHAR(77, 121, 83, 81, 76);

-- Retorna a string 'MySQL'
```

### CONCAT(N,...)

Retorna a string resultante da concatenação dos argumentos fornecidos.

```sql
SELECT CONCAT('My', 'S', 'QL');

-- Retorna a string 'MySQL'
```

### INSTR(str, substr)

Retorna a posição da primeira ocorrência da substring “substr” na string “str”. É o mesmo que o `LOCATE()` com dois argumentos, exceto pelo fato de que os argumentos estão trocados.

```sql
SELECT INSTR('SENAi', 'N');

-- Retorna 2
```

### LCASE(str)

Retorna a string "str" com todos os caracteres convertidos para letras minúsculas.

```sql
SELECT LCASE('SENAI');

-- Retorna 'senai'
```

### UCASE(str)

Retorna a string "str" com todos os caracteres convertidos para letras maiúsculas.

```sql
SELECT UCASE('senai');

-- Retorna 'SENAI'
```

### LEFT(str, tam)

Retorna os "tam" primeiros caracteres da string "str".

```sql
SELECT LEFT('senai', 3);

-- Retorna 'sen'
```

### RIGHT(str, tam)

Retorna os "tam" últimos caracteres da string "str".

```sql
SELECT RIGHT('senai', 3);

-- Retorna 'nai'
```

### LOCATE(substr, str)

Retorna a posição da primeira ocorrência da substring "substr" na string "str".

```sql
SELECT LOCATE('n', 'senai');

-- Retorna 4
```

### SUBSTRING(str, pos, tam)

Retorna a substring com "tam" caracteres da string "str", começando na posição "pos".

```sql
SELECT SUBSTRING('senai', 2, 3);

-- Retorna 'ena'
```

### LTRIM(str)

Retorna a string "str" com quaisquer espaços extras à esquerda removidos.

```sql
SELECT LTRIM('senai');

-- Retorna 'senai'
```

### RTRIM(str)

Retorna a string "str" com quaisquer espaços extras à direita removidos.

```sql
SELECT RTRIM('senai');

-- Retorna 'senai'
```

### TRIM(str)

Retorna a string "str" com quaisquer espaços extras à esquerda e à direita removidos.

```sql
SELECT TRIM('senai');

-- Retorna 'senai'
```

### REPLACE(str, de_str, para_str)

Retorna a string "str" com todas as ocorrências da substring "de_str" substituídas pela substring "para_str".

```sql
SELECT REPLACE('seMai', 'M', 'n');

-- Retorna 'senai'
```

### LENGTH(str)

Retorna o comprimento da string "str".

```sql
SELECT LENGTH('senai');

-- Retorna 5
```

### REVERSE(str)

Retorna a string "str" invertida.

```sql
SELECT REVERSE('senai');

-- Retorna 'ianes'
```

## Funções Numéricas

| Função    | Descrição                                                  |
|-----------|------------------------------------------------------------|
| +       | Adição                                                     |
| -       | Subtração                                                  |
| *       | Multiplicação                                              |
| /       | Divisão                                                    |
| %       | Retorna o resto da divisão                                 |
| ABS       | Retorna o valor absoluto                                   |
| SIGN      | Retorna o sinal de um valor                                |
| MOD       | Retorna o resto da divisão                                 |
| FLOOR     | Retorna o maior valor inteiro não maior que o valor dado   |
| CEIL      | Retorna o menor valor inteiro não menor que o valor dado   |
| ROUND     | Retorna o valor arredondado para o inteiro mais próximo    |
| DIV       | Divisão de inteiros                                        |
| POW       | Retorna um valor elevado a uma determinada potência        |
| SQRT      | Retorna a raiz quadrada de um valor                        |
| RAND      | Retorna um valor ponto flutuante aleatório                 |
| LEAST     | Retorna o menor valor em uma lista (Mínimo)                |
| GREATEST  | Retorna o maior valor em uma lista (Máximo)                |
| TRUNCATE  | Retorna um valor truncado para o número especificado de casas decimais |

### +

Realiza a adição entre dois números.

```sql
SELECT 3 + 4;

-- Retorna 7
```

### -

Realiza a subtração entre dois números.

```sql
SELECT 3 - 4;

-- Retorna -1
```

### *

Realiza a multiplicação entre dois números.

```sql
SELECT 3 * 4;

-- Retorna 12
```

### /

Realiza a divisão entre dois números.

```sql
SELECT 3 / 4;

-- Retorna 0.75
```

### %

Retorna o resto da divisão entre dois números.

```sql
SELECT 3 % 4;

-- Retorna 3
```

### ABS(x)

Retorna o valor absoluto de "x".

```sql
SELECT ABS(-4);

-- Retorna 4
```

### SIGN(x)

Retorna o sinal do número "x".

```sql
SELECT SIGN(-1);

-- Retorna -1
```

### MOD(N, M)

Retorna o resto da divisão entre "N" e "M".

```sql
SELECT MOD(29, 9);

-- Retorna 2
```

### DIV

Realiza a divisão de inteiros.

```sql
SELECT 25 DIV 5;

-- Retorna 5
```

### POW(X, Y)

Retorna o valor de "X" elevado à potência de "Y".

```sql
SELECT POW(2, 2);

-- Retorna 4
```

### LEAST(X, Y, ...)

Com dois ou mais argumentos, retorna o menor valor entre eles.

```sql
SELECT LEAST(2, 4, 1, 9, 7);

-- Retorna 1
```

### GREATEST(X, Y, ...)

Com dois ou mais argumentos, retorna o maior valor entre eles.

```sql
SELECT GREATEST(2, 4, 1, 9, 7);

-- Retorna 9
```

### RAND()

Retorna um valor de ponto flutuante aleatório na faixa de 0 a 1.0.

```sql
SELECT RAND();

-- Retorna um número aleatório entre 0 e 1.0
```

## Funções com Data e Hora

| Função        | Descrição                                                                                              |
|---------------|--------------------------------------------------------------------------------------------------------|
| DATE          | Separa a data da hora em um DATETIME.                                                                  |
| TIME          | Separa a hora da data em um DATETIME.                                                                  |
| DAYOFWEEK     | Retorna o dia da semana de um DATE (1 = Domingo, 2 = Segunda-feira, ..., 7 = Sábado).                   |
| DAY           | Retorna o dia de um DATE.                                                                              |
| MONTH         | Retorna o mês de um DATE (1 = Janeiro, 2 = Fevereiro, ..., 12 = Dezembro).                             |
| WEEK          | Retorna a semana de um DATE.                                                                           |
| HOUR          | Retorna as horas de um TIME.                                                                           |
| MINUTE        | Retorna os minutos de um TIME.                                                                         |
| SECOND        | Retorna os segundos de um TIME.                                                                        |
| DATE_ADD      | Realiza operações de soma e subtração de datas.                                                        |
| DATEDIFF      | Retorna o número de dias entre duas datas.                                                              |
| TIMEDIFF      | Retorna o intervalo de tempo (dias e horas) entre duas datas.                                           |
| DATE_FORMAT   | Altera o formato de uma data conforme especificado.                                                     |
| LAST_DAY      | Retorna o último dia do mês de uma data.                                                               |
| CURRENT_DATE  | Retorna a data atual.                                                                                  |
| CURRENT_TIME  | Retorna o tempo atual.                                                                                 |
| CURRENT_TIMESTAMP | Retorna a data e hora atuais.                                                                         |

### DATE(expr)

Extrai a parte da data da expressão `date` ou `datetime` em "expr".

```sql
SELECT DATE('2003-12-31 01:02:03');

-- Retorna '2003-12-31'
```

### TIME(expr)

Extrai a parte da hora da expressão `time` ou `datetime` em "expr".

```sql
SELECT TIME('2003-12-31 01:02:03');

-- Retorna '01:02:03'
```

### DAYOFWEEK(data)

Retorna o índice do dia da semana para "data" (1 = Domingo, 2 = Segunda, ..., 7 = Sábado).

```sql
SELECT DAYOFWEEK('1998-02-03');

-- Retorna 3 (terça-feira)
```

### WEEK(data)

Retorna o número da semana para "date".

```sql
SELECT WEEK('1998-02-03');

-- Retorna 6
```

### DAY(data)

Retorna o dia do mês para "data", na faixa de 1 até 31.

```sql
SELECT DAY('1998-02-03');

-- Retorna 3
```

### MONTH(data)

Retorna o mês para "data", na faixa de 1 até 12.

```sql
SELECT MONTH('1998-02-03');

-- Retorna 2 (Fevereiro)
```

### YEAR(data)

Retorna o ano para "data".

```sql
SELECT YEAR('1998-02-03');

-- Retorna 1998
```

### HOUR(hora)

Retorna a hora para "hora".

```sql
SELECT HOUR('10:05:32');

-- Retorna 10
```

### MINUTE(hora)

Retorna o minuto para "hora".

```sql
SELECT MINUTE('10:05:32');

-- Retorna 5
```

### SECOND(hora)

Retorna o segundo para "hora".

```sql
SELECT SECOND('10:05:32');

-- Retorna 32
```

### DATE_ADD(data, INTERVAL tipo expr)

Realiza operações aritméticas em datas.

```sql
SELECT DATE_ADD('1997-12-31 23:59:59', INTERVAL 1 YEAR);
SELECT DATE_ADD('1997-12-31 23:59:59', INTERVAL 1 MONTH);
SELECT DATE_ADD('1997-12-31 23:59:59', INTERVAL 1 DAY);
SELECT DATE_ADD('1997-12-31 23:59:59', INTERVAL 1 HOUR);
SELECT DATE_ADD('1997-12-31 23:59:59', INTERVAL 1 MINUTE);
SELECT DATE_ADD('1997-12-31 23:59:59', INTERVAL 1 SECOND);

--Resultado: Dependerá do intervalo específico adicionado.
```

### DATEDIFF(expr, expr2)

Retorna o número de dias entre a data inicial "expr" e a data final "expr2".

```sql
SELECT DATEDIFF('1997-12-31 23:59:59','1997-12-30');

-- Retorna 1
```

### TIMEDIFF(expr, expr2)

Retorna o tempo entre a hora inicial "expr" e a hora final "expr2".

```sql
SELECT TIMEDIFF('1997-12-31 23:59:59','1997-12-30');

-- Retorna 23:59:59
```

### DATE_FORMAT(data, formato)

Formata o valor de "data" de acordo com a string "formato".

```sql
SELECT DATE_FORMAT('1997-10-04 22:23:00', '%W %M %Y');
SELECT DATE_FORMAT('1997-10-04 22:23:00', '%H:%i:%s');
SELECT DATE_FORMAT('1997-10-04 22:23:00', '%D %y %a %d %m %b %j');
SELECT DATE_FORMAT('1997-10-04 22:23:00', '%H %k %I %r %T %S %w');
SELECT DATE_FORMAT('1999-01-01', '%X %V');

-- Resultado: Dependerá do formato especificado.
```

### LAST_DAY(data)

Retorna o último dia do mês correspondente à "data".

```sql
SELECT LAST_DAY('2004-01-01 01:01:01');

-- Retorna '2004-01-31'
```

### CURDATE(), CURRENT_DATE, CURRENT_DATE()

Retorna a data atual.

```sql
SELECT CURDATE();

-- Resultado: Dependerá da data e hora atual.
```

### CURTIME(), CURRENT_TIME, CURRENT_TIME()

Retorna a hora atual.

```sql
SELECT CURTIME();

-- Resultado: Dependerá da data e hora atual.
```

### SYSDATE(), CURRENT_TIMESTAMP, LOCALTIME, LOCALTIME(), CURRENT_TIMESTAMP(), LOCALTIMESTAMP, NOW(), LOCALTIMESTAMP()

Retorna a data e hora atual.

```sql
SELECT CURRENT_TIMESTAMP();

-- Resultado: Dependerá da data e hora atual.
```

## Funções Conversão

As funções `CAST()` e `CONVERT()` são utilizadas para converter um valor de um tipo para outro. Aqui estão os exemplos de sintaxe e uso:

### CAST(expressão AS tipo)

Converte a expressão para o tipo especificado.

```sql
SELECT CAST('2000-01-01' AS DATE);

-- '2000-01-01'
```

### CONVERT(expressão, tipo)

Converte a expressão para o tipo especificado.

```sql
SELECT CONVERT('2000-01-01', DATE);

-- '2000-01-01'
```

Ambas as funções têm a mesma funcionalidade de conversão de tipos, e a escolha entre elas depende principalmente da preferência pessoal ou da compatibilidade com sistemas específicos de banco de dados.
