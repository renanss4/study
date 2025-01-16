# MySQL Functions

## String Functions

| Function    | Description                                          |
|-----------|----------------------------------------------------|
| ASCII     | Returns the ASCII code of a character             |
| CHAR      | Returns a String with the specified value         |
| CONCAT    | Concatenates the specified values                 |
| INSTR     | Returns the initial position of a SubString       |
| LCASE     | Converts a String to lowercase                    |
| UCASE     | Converts a String to uppercase                    |
| LEFT      | Returns the leftmost characters of a String       |
| RIGHT     | Returns the rightmost characters of a String      |
| LOCATE    | Returns the position of a SubString               |
| LTRIM     | Returns a string with leading spaces removed      |
| RTRIM     | Returns a string with trailing spaces removed     |
| SUBSTRING | Returns a substring of a string                   |
| REPLACE   | Replaces a substring in a string                  |
| TRIM      | Removes leading and trailing spaces from a string |
| LENGTH    | Returns the length of a string                    |
| REVERSE   | Returns a reversed string                         |

### ASCII(str)

Returns the ASCII code value of the first character in the string "str". Returns 0 if "str" is an empty string.

```sql
SELECT ASCII('A');

-- The ASCII code of character 'A' is 65
```

### CHAR(N,...)

CHAR() interprets the arguments as integers and returns a string with characters corresponding to the ASCII values of those integers. NULL values are disregarded.

```sql
SELECT CHAR(77, 121, 83, 81, 76);

-- Returns the string 'MySQL'
```

### CONCAT(N,...)

Returns the string resulting from concatenating the provided arguments.

```sql
SELECT CONCAT('My', 'S', 'QL');

-- Returns the string 'MySQL'
```

### INSTR(str, substr)

Returns the position of the first occurrence of the substring "substr" in the string "str". It is the same as `LOCATE()` with two arguments, except that the arguments are swapped.

```sql
SELECT INSTR('SENAi', 'N');

-- Returns 2
```

### LCASE(str)

Returns the string "str" with all characters converted to lowercase.

```sql
SELECT LCASE('SENAI');

-- Returns 'senai'
```

### UCASE(str)

Returns the string "str" with all characters converted to uppercase.

```sql
SELECT UCASE('senai');

-- Returns 'SENAI'
```

### LEFT(str, len)

Returns the first "len" characters of the string "str".

```sql
SELECT LEFT('senai', 3);

-- Returns 'sen'
```

### RIGHT(str, len)

Returns the last "len" characters of the string "str".

```sql
SELECT RIGHT('senai', 3);

-- Returns 'nai'
```

### LOCATE(substr, str)

Returns the position of the first occurrence of the substring "substr" in the string "str".

```sql
SELECT LOCATE('n', 'senai');

-- Returns 4
```

### SUBSTRING(str, pos, len)

Returns the substring with "len" characters from the string "str", starting at position "pos".

```sql
SELECT SUBSTRING('senai', 2, 3);

-- Returns 'ena'
```

### LTRIM(str)

Returns the string "str" with any leading spaces removed.

```sql
SELECT LTRIM('senai');

-- Returns 'senai'
```

### RTRIM(str)

Returns the string "str" with any trailing spaces removed.

```sql
SELECT RTRIM('senai');

-- Returns 'senai'
```

### TRIM(str)

Returns the string "str" with any leading and trailing spaces removed.

```sql
SELECT TRIM('senai');

-- Returns 'senai'
```

### REPLACE(str, from_str, to_str)

Returns the string "str" with all occurrences of the substring "from_str" replaced by the substring "to_str".

```sql
SELECT REPLACE('seMai', 'M', 'n');

-- Returns 'senai'
```

### LENGTH(str)

Returns the length of the string "str".

```sql
SELECT LENGTH('senai');

-- Returns 5
```

### REVERSE(str)

Returns the reversed string "str".

```sql
SELECT REVERSE('senai');

-- Returns 'ianes'
```

## Numeric Functions

| Function    | Description                                           |
|-----------|-----------------------------------------------------|
| +       | Addition                                             |
| -       | Subtraction                                          |
| *       | Multiplication                                       |
| /       | Division                                             |
| %       | Modulo (Remainder)                                   |
| ABS     | Absolute value                                       |
| SIGN    | Sign of a number                                     |
| MOD     | Modulo (Remainder)                                   |
| FLOOR   | Largest integer not greater than a given number      |
| CEIL    | Smallest integer not less than a given number       |
| ROUND   | Round a number to a specified number of decimal places |
| DIV     | Integer division                                     |
| POW     | Power of a number                                    |
| SQRT    | Square root                                          |
| RAND    | Generate a random floating-point value between 0 and 1  |
| LEAST   | Return the smallest argument                         |
| GREATEST | Return the largest argument                         |
| TRUNCATE | Truncate a number to a specified number of decimal places |

### +

Performs addition between two numbers.

```sql
SELECT 3 + 4;

-- Returns 7
```

### -

Performs subtraction between two numbers.

```sql
SELECT 3 - 4;

-- Returns -1
```

### *

Performs multiplication between two numbers.

```sql
SELECT 3 * 4;

-- Returns 12
```

### /

Performs division between two numbers.

```sql
SELECT 3 / 4;

-- Returns 0.75
```

### %

Returns the remainder of the division between two numbers.

```sql
SELECT 3 % 4;

-- Returns 3
```

### ABS(x)

Returns the absolute value of "x".

```sql
SELECT ABS(-4);

-- Returns 4
```

### SIGN(x)

Returns the sign of the number "x".

```sql
SELECT SIGN(-1);

-- Returns -1
```

### MOD(N, M)

Returns the remainder of the division between "N" and "M".

```sql
SELECT MOD(29, 9);

-- Returns 2
```

### DIV

Performs integer division.

```sql
SELECT 25 DIV 5;

-- Returns 5
```

### POW(X, Y)

Returns the value of "X" raised to the power of "Y".

```sql
SELECT POW(2, 2);

-- Returns 4
```

### LEAST(X, Y, ...)

With two or more arguments, returns the smallest value among them.

```sql
SELECT LEAST(2, 4, 1, 9, 7);

-- Returns 1
```

### GREATEST(X, Y, ...)

With two or more arguments, returns the largest value among them.

```sql
SELECT GREATEST(2, 4, 1, 

9, 7);

-- Returns 9
```

### RAND()

Returns a random floating-point value in the range of 0 to 1.0.

```sql
SELECT RAND();

-- Returns a random number between 0 and 1.0
```

## Date and Time Functions

| Function        | Description                                                                                               |
|---------------|---------------------------------------------------------------------------------------------------------|
| DATE          | Extracts the date part of a datetime expression                                                            |
| TIME          | Extracts the time part of a datetime expression                                                            |
| DAYOFWEEK     | Returns the weekday index of a date (1 = Sunday, 2 = Monday, ..., 7 = Saturday)                             |
| DAY           | Extracts the day of a date                                                                                  |
| MONTH         | Extracts the month of a date (1 = January, 2 = February, ..., 12 = December)                                |
| WEEK          | Returns the week number for a date                                                                         |
| HOUR          | Extracts the hour from a time                                                                              |
| MINUTE        | Extracts the minute from a time                                                                            |
| SECOND        | Extracts the second from a time                                                                            |
| DATE_ADD      | Adds or subtracts an interval to a date                                                                      |
| DATEDIFF      | Subtracts two dates to get the number of days between them                                                  |
| TIMEDIFF      | Subtracts two times                                                                                         |
| DATE_FORMAT   | Formats a date as specified                                                                                |
| LAST_DAY      | Returns the last day of the month for a given date                                                          |
| CURRENT_DATE  | Returns the current date                                                                                    |
| CURRENT_TIME  | Returns the current time                                                                                    |
| CURRENT_TIMESTAMP | Returns the current date and time                                                                        |

### DATE(expr)

Extracts the date part of the datetime expression `expr`.

```sql
SELECT DATE('2003-12-31 01:02:03');

-- Returns '2003-12-31'
```

### TIME(expr)

Extracts the time part of the datetime expression `expr`.

```sql
SELECT TIME('2003-12-31 01:02:03');

-- Returns '01:02:03'
```

### DAYOFWEEK(date)

Returns the weekday index for "date" (1 = Sunday, 2 = Monday, ..., 7 = Saturday).

```sql
SELECT DAYOFWEEK('1998-02-03');

-- Returns 3 (Tuesday)
```

### WEEK(date)

Returns the week number for "date".

```sql
SELECT WEEK('1998-02-03');

-- Returns 6
```

### DAY(date)

Returns the day of the month for "date", ranging from 1 to 31.

```sql
SELECT DAY('1998-02-03');

-- Returns 3
```

### MONTH(date)

Returns the month for "date", ranging from 1 to 12.

```sql
SELECT MONTH('1998-02-03');

-- Returns 2 (February)
```

### YEAR(date)

Returns the year for "date".

```sql
SELECT YEAR('1998-02-03');

-- Returns 1998
```

### HOUR(time)

Returns the hour for "time".

```sql
SELECT HOUR('10:05:32');

-- Returns 10
```

### MINUTE(time)

Returns the minute for "time".

```sql
SELECT MINUTE('10:05:32');

-- Returns 5
```

### SECOND(time)

Returns the second for "time".

```sql
SELECT SECOND('10:05:32');

-- Returns 32
```

### DATE_ADD(date, INTERVAL type expr)

Performs arithmetic operations on dates.

```sql
SELECT DATE_ADD('1997-12-31 23:59:59', INTERVAL 1 YEAR);
SELECT DATE_ADD('1997-12-31 23:59:59', INTERVAL 1 MONTH);
SELECT DATE_ADD('1997-12-31 23:59:59', INTERVAL 1 DAY);
SELECT DATE_ADD('1997-12-31 23:59:59', INTERVAL 1 HOUR);
SELECT DATE_ADD('1997-12-31 23:59:59', INTERVAL 1 MINUTE);
SELECT DATE_ADD('1997-12-31 23:59:59', INTERVAL 1 SECOND);

-- Result: Depends on the specific interval added.
```

### DATEDIFF(expr1, expr2)

Returns the number of days between the start date "expr1" and the end date "expr2".

```sql
SELECT DATEDIFF('1997-12-31 23:59:59','1997-12-30');

-- Returns 1
```

### TIMEDIFF(expr1, expr2)

Returns the time interval (days and hours) between two dates.

```sql
SELECT TIMEDIFF('1997-12-31 23:59:59','1997-12-30');

-- Returns 23:59:59
```

### DATE_FORMAT(date, format)

Formats the value of "date" according to the string "format".

```sql
SELECT DATE_FORMAT('1997-10-04 22:23:00', '%W %M %Y');
SELECT DATE_FORMAT('1997-10-04 22:23:00', '%H:%i:%s');
SELECT DATE_FORMAT('1997-10-04 22:23:00', '%D %y %a %d %m %b %j');
SELECT DATE_FORMAT('1997-10-04 22:23:00', '%H %k %I %r %T %S %w');
SELECT DATE_FORMAT('1999-01-01', '%X %V');

-- Result: Depends on the specified format.
```

### LAST_DAY(date)

Returns the last day of the month for the given "date".

```sql
SELECT LAST_DAY('2004-01-01 01:01:01');

-- Returns '2004-01-31'
```

### CURDATE(), CURRENT_DATE, CURRENT_DATE()

Returns the current date.

```sql
SELECT CURDATE();

-- Result: Depends on the current date and time.
```

### CURTIME(), CURRENT_TIME, CURRENT_TIME()

Returns the current time.

```sql
SELECT CURTIME();

-- Result: Depends on the current date and time.
```

### SYSDATE(), CURRENT_TIMESTAMP, LOCALTIME, LOCALTIME(), CURRENT_TIMESTAMP(), LOCALTIMESTAMP, NOW(), LOCALTIMESTAMP()

Returns the current date and time.

```sql
SELECT CURRENT_TIMESTAMP();

-- Result: Depends on the current date and time.
```

## Conversion Functions

The `CAST()` and `CONVERT()` functions are used to convert a value from one type to another. Here are the syntax and usage examples:

### CAST(expression AS type)

Converts the expression to the specified type.

```sql
SELECT CAST('2000-01-01' AS DATE);

-- '2000-01-01'
```

### CONVERT(expression, type)

Converts the expression to the specified type.

```sql
SELECT CONVERT('2000-01-01', DATE);

-- '2000-01-01'
```

Both functions have the same functionality of type conversion, and the choice between them mainly depends on personal preference or compatibility with specific database systems.