# MySQL Functions

Funções String


ASCII		Retorna o código ASCII de um valor
CHAR		Retorno uma String com o valor informado
CONCAT	Concatena os valores informados
INSTR		Retorna a posição inicial de uma SubString
LCASE		Converte uma String em letras minúsculas
UCASE		Converte uma String em letras maiúsculas
LEFT		Retorna os caracteres a esquerda da String
RIGHT		Retorna os caracteres a direita da String
LOCATE	Retorna a posicao de uma SubString
LTRIM		Retorna uma string sem espaços a esquerda
RTRIM		Retorna uma string sem espaços a direita
SUBSTRING	Retorna uma substring de uma string
REPLACE	Substitui uma substring em uma string
TRIM		Retira os espaços da esquerda e direita
LENGTH	Retorna o tamanho de uma string
REVERSE	Retorna uma string invertida


ASCII(str)

Retorna o valor do código ASCII do caracter mais a esquerda da string “str”. Retorna 0 se str é uma string vazia.

SELECT ASCII('A');

---

CHAR(N,...)

CHAR() interpretia os argumentos como inteiros e retorna uma string com caracteres dados pelo valor do código ASCII referentes a estes inteiros. Valores NULL são desconsiderados.

SELECT CHAR(77,121,83,81,'76');

---

CONCAT(N,...)

	Retorna a string resultante da concatenação dos argumentos.

SELECT CONCAT('My', 'S', 'QL');

---

INSTR(str,substr)

Retorna a posição da primeira ocorrência da substring “substr” na string “str”. É o mesmo que as o LOCATE() com dois argumentos, exceto pelo fato de que os argumentos estão tracados

SELECT INSTR('SENAi', 'N');

---

LCASE(str)

Retorna a string str com todos caracteres alterados para letra minúsculas

SELECT LCASE(‘SENAI');

---

UCASE(str)

Retorna a string str com todos caracteres alterados para letra maiúsculas

SELECT UCASE('senai');

---

LEFT(str,tam)

Retorna os “tam” caracteres mais a esquerda da string “str”

SELECT LEFT('senai', 3);

---

RIGHT(str,tam)

Retorna os “tam” caracteres mais a direita da string “str”

SELECT RIGHT('senai', 3);

---

LOCATE(substr,str)

A primeira sintaxe retorna a posição da primeira ocorrência da substring “substr” na string “str”.

SELECT LOCATE('n', 'senai');

---

SUBSTRING(str,pos,tam)

Retorna a substring com "tam" caracteres da string "str", iniciando da posição "pos".

SELECT SUBSTRING('senai',2,3);

---

LTRIM(str)

Retorna a string “str” com caracteres de espaços extras iniciais removidos.

SELECT LTRIM('senai');

---

RTRIM(str)

Retorna a string “str” com caracteres de espaços extras finais removidos.

SELECT RTRIM('senai');

---

TRIM(str)

Retorna a string “str” com caracteres de espaços extras iniciais e finais removidos.

SELECT TRIM('senai');

---

REPLACE(str, de_str,para_str)

Retorna a string str com todas ocorrências da string “dea_str” substituida pela string “para_str”.

SELECT REPLAC('seMai', 'M', 'n');

---

LENGTH(str)

Retorna o tamanho da string "str“.

SELECT LENGTH('senai');

---

REVERSE(str)

Retorna a str invertida.

SELECT REVERSE('senai');

---

Funções Numéricas


'+'		Adição
'-'		Subtração
'*'		Multiplicação
/		Divisão
%		Retorna o resto da divisão
ABS		Retorna o valor absoluto
SIGN		Retorna o sinal de um valor
MOD		Retorna o resto da divisão
FLOOR		Retorna o maior valor inteiro não maior que 		o valor informado
CEIL		Retorna o menor valor inteiro não menor que 		o valor informado
ROUND		Retorna o valor arredondado para o inteiro 		mais próximo
DIV		Divisão de inteiros
POW		Retorna um valor elevado a uma determinada 		potencia
SQRT		Retorna a raiz quadrada de um valor
RAND		Retorna um valor ponto flutuante aleatório
LEAST		Retorna o menor valor em uma lista (Min)
GREATEST	Retorna o maior valor em uma lista (Max)
TRUNCATE	Retorna um valor truncado das casas 			decimais

'+'

Adição.

SELECT 3 + 4;

---

'-'

Subtração.

SELECT 3 - 4;

---

'*'

Multiplicação.

SELECT 3 * 4;

---

/

Divisão.

SELECT 3 / 4;

---

%

Retorna o resto da divisão.

SELECT 3 % 4;

---

ABS(x)

Retorna o valor Absoluto de “x”.

SELECT ABS(-4);

---

SIGN(X)

Retorna o sinal do número.

SELECT SING(-1);

---

MOD(N,M)

Retorna o resto da divisão entre “N” e “M”.

SELECT MOD(29,9);

---

DIV

Divisão de inteiros.

SELECT 25 DIV 5;

---

POW(X, Y)
Retorna o valor de “X” elevado a potência de “Y”.

SELECT POW(2, 2);

---

LEAST(X, Y, ...)

Com dois ou mais argumentos, retorna o menor (valor-mínimo) argumento.

SELECT LEAST (2, 4, 1, 9, 7);

---

GREATEST(X, Y, ...)

Com dois ou mais argumentos, retorna o maior (valor-máximo) argumento.

SELECT GREATEST(2, 4, 1, 9, 7);

---

RAND()

Retorna um valor de ponto flutuante aleatório na faixa de 0 a 1.0.

SELECT RAND();

---

FUnções com Data e Hora


DATE		Separa a data da hora em um DATETIME
TIME		Separa a hora da data em um DATETIME
DAYOFWEEK	Retorna o dia da semana de um DATE
DAY		Retorna o dia de um DATE
MONTH		Retorna o mês de um DATE
WEEK		Retorna a semana de um DATE
HOUR		Retorna as hora de um TIME
MINUTE	Retorna os minutos de um TIME
SECOND	Retorna os segundos de um TIME
DATE_ADD	Realiza operações de soma e subtração de 			datas
DATEDIFF	Retorna o número de dias entre duas datas
TIMEDIFF	Retorna o número de dias e horas entre duas 		datas
DATE_FORMAT	Altera o formato de uma data
LAST_DAY 	Retorna o ultimo dia do mês de uma data
CURRENT...	Retorna o valor atual de acordo com o tipo 		escolhido

DATE(expr)

Extrai a parte da data da expressão date ou datetime em “expr”.

SELECT DATE('2003-12-31 01:02:03');

---

TIME(expr)

Extrai a parte da hora da expressão time ou datetime em “expr”.

SELECT TIME('2003-12-31 01:02:03');

---

DAYOFWEEK(data)

Retorna o índice do dia da semana para data (1 = Domingo, 2 = Segunda, ... 7 = Sábado).

SELECT DAYOFWEEK('1998-02-03');

---

WEEK(data)

A função retorna o número da semana para date.

SELECT WEEK('1998-02-03');

---

DAY (data)
Retorna o dia do mês para data, na faixa de 1 até 31.

SELECT DAY('1998-02-03');

---

MONTH(data)
Retorna o mês para data, na faixa de 1 até 12.

SELECT MONTH('1998-02-03');

---

YEAR(data)
Retorna o ano para data.

SELECT YEAR('1998-02-03');

---

HOUR(hora)
Retorna a hora para hora.

SELECT HOUR('10:05:32');

---

MINUTE(hora)
Retorna o minuto para hora.

SELECT MINUTE('10:05:32');

---

SECOND(hora)
Retorna o segundo para hora.

SELECT SECOND('10:05:32');

---

DATE_ADD(data,INTERVAL tipo expr)
Estas funções realizam operações aritméticas em datas.

---

DATE_ADD(data,INTERVAL tipo expr)
Estas funções realizam operações aritméticas em datas.

```sql
SELECT DATE_ADD('1997-12-31 23:59:59', INTERVAL 1 YEAR);


SELECT DATE_ADD('1997-12-31 23:59:59', INTERVAL 1 MONTH);


SELECT DATE_ADD('1997-12-31 23:59:59', INTERVAL 1 DAY);


SELECT DATE_ADD('1997-12-31 23:59:59', INTERVAL 1 HOUR);


SELECT DATE_ADD('1997-12-31 23:59:59', INTERVAL 1 MINUTE);


SELECT DATE_ADD('1997-12-31 23:59:59', INTERVAL 1 SECOND);
```

---

DATEDIFF(expr, expr2)

Retorna o número de dias entre a data inicial “expr” e a data final “expr2”.

SELECT DATEDIFF('1997-12-31 23:59:59','1997-12-30');

---

TIMEDIFF(expr, expr2)

Retorna o tempo entre a hora inicial expr e a hora final expr2.

SELECT TIMEDIFF('1997-12-31 23:59:59','1997-12-30');

---

DATE_FORMAT(data, formato)

Formata o valor de “data” de acordo com a string “formato”.

quais os possiveis argumentos ?
-
-


```sql
SELECT DATE_FORMAT('1997-10-04 22:23:00', '%W %M %Y');
SELECT DATE_FORMAT('1997-10-04 22:23:00', '%H:%i:%s');
SELECT DATE_FORMAT('1997-10-04 22:23:00', '%D %y %a %d %m %b %j');
SELECT DATE_FORMAT('1997-10-04 22:23:00', '%H %k %I %r %T %S %w');
SELECT DATE_FORMAT('1999-01-01', '%X %V');
```

LAST_DAY(data)

Pega um valor date ou datetime e retorna o valor correspondente para o último dia do mês.

SELECT LAST_DAY('2004-01-01 01:01:01');

---

CURDATE(), CURRENT_DATE, CURRENT_DATE()

Retorna a data atual.

SELECT CURDATE();

---

CURTIME(), CURRENT_TIME, CURRENT_TIME()

Retorna a hora atual.
.

SELECT CURTIME();

---

SYSDATE(), CURRENT_TIMESTAMP, LOCALTIME, LOCALTIME(), CURRENT_TIMESTAMP(), LOCALTIMESTAMP, NOW(), LOCALTIMESTAMP()

Retorna a data e hora atual.

SELECT CURRENT_TIMESTAMP();

---

Funções Conversão

As funções CAST() e CONVERT() devem ser usada para tomar um valor de um tipo e produzir um valor de outro tipo. As suas
sintaxes são as seguintes:

CAST(expressão AS tipo)
CONVERT(expressão,tipo)

SELECT CAST('2000-01-01' AS DATE);
SELECT CONVERT('2000-01-01', DATE)
