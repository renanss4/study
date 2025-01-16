# Stored Procedures and Functions

A Stored Procedure and Function are a set of SQL commands that can be stored on the server. Once this is done, clients do not need to resend individual commands but can make a reference.

Stored Procedures and Functions can provide a performance boost since less information needs to be sent between the server and the client.

The downside is that this increases the load on the database server system, as most of the work is done on the server side and less on the client side.

## Creating a Stored Procedure:

```sql
DELIMITER $$
CREATE PROCEDURE procedure_name (parameter_1, ..., OUT parameter_n)
BEGIN 
	-- Body of the stored procedure here
END $$
DELIMITER ;
```

**Example:**

```sql
DELIMITER $$
CREATE PROCEDURE sp_sum (Number_1 int, Number_2 int, OUT result int)
BEGIN 
	set result = Number_1 + Number_2;
END $$
DELIMITER ;
```

## Creating a Function:

```sql
DELIMITER $$
CREATE FUNCTION function_name(parameter_1,...,parameter_n) RETURNS type
BEGIN 
	return variable_name;
END $$
DELIMITER ;
```

Example:

```sql
DELIMITER $$
CREATE FUNCTION fn_sum (Number_1 int, Number_2 int) RETURNS int
BEGIN 
	declare result int;
	set result = Number_1 + Number_2;
	return result;
END $$
DELIMITER ;
```

## Variable Declaration:

```sql
declare variable_name variable_type;
```

### Assigning a Value to a Variable:

```sql
Set variable_name = value;
```

```sql
SELECT variable_name = table_field
FROM table
WHERE condition;
```

### Altering a Stored Procedure:

```sql
DELIMITER $$
ALTER PROCEDURE procedure_name (param_1,..., param_n OUT)
BEGIN 
	-- Body of the stored procedure here
END $$
DELIMITER ;
```

### Altering a Function:

```sql
DELIMITER $$
ALTER FUNCTION function_name (param_1,...,param_n) RETURNS type
BEGIN 
	return variable_name;
END $$
DELIMITER ;
```

### Removing a Stored Procedure:

```sql
DROP PROCEDURE procedure_name;
```

### Removing a Function:

```sql
DROP FUNCTION function_name;
```

### Viewing the Content of a Stored Procedure:

```sql
SHOW CREATE PROCEDURE procedure_name;
```

### Viewing the Content of a Function:

```sql
SHOW CREATE FUNCTION function_name;
```

### Using a Stored Procedure:

```sql
CALL procedure_name (param_1,..., param_n OUT);
```

### Using a Function:

```sql
SELECT function_name (param_1,..., param_n);
```

### Practical Example of Stored Procedure:

**Description:**
Suppose in an online store management system, you want to create a stored procedure to calculate the total value of a purchase, taking into account the item prices, quantity, and applicable discount.

```sql
DELIMITER $$

CREATE PROCEDURE calculate_total_value(
    IN customer_id INT,
    OUT total_with_discount DECIMAL(10, 2)
)
BEGIN
    DECLARE total_without_discount DECIMAL(10, 2);
    DECLARE customer_discount DECIMAL(5, 2);
    
    -- Calculate total without discount
    SELECT SUM(price * quantity) INTO total_without_discount
    FROM purchase_items
    WHERE customer_id = customer_id;
    
    -- Calculate customer discount (hypothetical example)
    SELECT discount INTO customer_discount
    FROM customers
    WHERE id = customer_id;
    
    -- Apply discount to total
    SET total_with_discount = total_without_discount * (1 - (customer_discount / 100));
END $$

DELIMITER ;
```

**Example of Usage:**
```sql
CALL calculate_total_value(123, @total_with_discount);
SELECT @total_with_discount;
```

In this example, the stored procedure `calculate_total_value` takes the customer ID as input and returns the total purchase value after applying the corresponding discount.

### Practical Example of Function:

**Description:**
Suppose in an online store management system, you need a function that returns the total price of an item, including taxes and shipping, to display on the product details page.

```sql
DELIMITER $$

CREATE FUNCTION calculate_total_price(
    unit_price DECIMAL(10, 2),
    quantity INT
) RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE total_price DECIMAL(10, 2);
    DECLARE tax_rate DECIMAL(5, 2);
    DECLARE shipping_cost DECIMAL(10, 2);
    
    -- Get tax rate (hypothetical example)
    SET tax_rate = 0.10;
    
    -- Get shipping cost (hypothetical example)
    SET shipping_cost = 5.00;
    
    -- Calculate total price
    SET total_price = (unit_price * quantity) * (1 + tax_rate) + shipping_cost;
    
    RETURN total_price;
END $$

DELIMITER ;
```

**Example of Usage:**

```sql
SELECT calculate_total_price(20.00, 3);
```

In this example, the `calculate_total_price` function takes the unit price of the item and the desired quantity as input and returns the total price of the item, considering the tax and shipping cost. This can be useful for displaying the total price of a product on a product details page.

## Resources within Stored Procedure:

### IF

The `IF` statement allows you to execute a block of code if a specified condition is true or another block of code if the condition is false.

```sql
IF condition THEN
	code_block
ELSEIF condition THEN
	code_block
ELSE 
	code_block
END IF;
```

### WHILE

The `WHILE` statement allows you to repeatedly execute a block of code while a specified condition is true.

```sql
WHILE condition DO
	code_block
END WHILE;
```

### CASE

The `CASE` statement allows you to execute different code blocks based on the value of a variable or expression.

```sql
CASE variable
	WHEN value THEN code_block
	WHEN value THEN code_block
	ELSE code_block
END CASE;
```

### REPEAT

The `REPEAT` statement allows you to repeatedly execute a block of code until a specified condition is true.

```sql
REPEAT
	code_block
	UNTIL condition
END REPEAT;
```

### Loop

The `LOOP` statement allows you to repeatedly execute a block of code until a condition is met. It can be used in conjunction with `LEAVE` to exit the loop and `ITERATE` to move to the next iteration.

```sql
loop_variable LOOP
	
	code_block

END LOOP;

Exit the loop:
LEAVE loop_variable;

Do one more iteration in the loop:
ITERATE loop_variable;
```

### CURSOR

A cursor is an object that allows you to traverse the results of a SQL query row by row.

```sql
DECLARE control INT DEFAULT 0;

DECLARE cursor_name CURSOR FOR query;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET control = 1;

OPEN cursor_name;
FETCH cursor_name INTO variable;

CLOSE cursor_name;
```

```sql
CREATE PROCEDURE sum_age(OUT SUM INT)
BEGIN
	DECLARE done INT DEFAULT 0;
	DECLARE vAge int;
	DECLARE cur_student CURSOR FOR SELECT age FROM student;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
	SET

 SUM = 0;
	OPEN cur_student;
	FETCH cur_student INTO vAge;
	while not (done = 1) do
		IF vAge is not null THEN
			set sum = sum + vAge;
		END IF;
		FETCH cur_student INTO vAge;
	END while;
	CLOSE cur_student;
END;
```