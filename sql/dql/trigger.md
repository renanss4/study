# Trigger

A Trigger, also known as a Trigger, is a feature used when an action needs to be automatically executed upon inserting, updating, or deleting records from a table. Although powerful, the use of triggers should be done with caution as it can impact system performance and code maintainability.

## When to Use Triggers:

Triggers are useful in scenarios where business logic needs to be automatically applied in response to changes in table data. However, it's important to consider alternatives such as foreign key constraints or stored procedures depending on the context and complexity of the problem.

Triggers can be applied in various cases such as:

- Alerting the user about exceptions
- Performing data auditing
- Measuring system performance
- Tracking specific events

## Best Practices When Using Triggers:

- Keep trigger logic simple and straightforward to facilitate maintenance.
- Avoid complex actions within triggers, such as cascading updates across multiple tables.
- Clearly document the purpose and behavior of the trigger for future reference.
- Test triggers carefully to ensure they behave as expected in all situations.

## Creating a Trigger:

```sql
DELIMITER $$
CREATE TRIGGER trigger_name TIME_EVENT ON table_name FOR EACH ROW
BEGIN 
    -- Trigger logic here
END $$
DELIMITER ;
```

**Available Time Events:**

- BEFORE INSERT
- AFTER INSERT
- BEFORE UPDATE
- AFTER UPDATE
- BEFORE DELETE
- AFTER DELETE

## Checking Values in the Trigger:

- **Old Values:** `OLD.column_name`
- **New Values:** `NEW.column_name`

## Example of Trigger for Error on Delete:

```sql
CREATE TRIGGER tr_error BEFORE DELETE ON student FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete a student without age';
END;
```

## Variable Declaration:

```sql
DECLARE variable_name variable_type;
```

## Assigning Value to Variable:

```sql
SET variable_name = value;
```

```sql
SELECT variable_name = table_field
FROM table
WHERE condition;
```

## Example to Create an Error for the User:

```sql
CREATE TRIGGER tr_error BEFORE DELETE ON student FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete a student without age';

END $$
DELIMITER ;
```

## Resources within Trigger:

Here is a detailed description of each resource within a trigger in SQL, along with practical examples for each:

### IF

The `IF` statement is used to execute an action based on a specific condition. It can be used alone or in conjunction with `ELSEIF` and `ELSE` to handle multiple conditions.

Example:

```sql
IF balance < 0 THEN
    UPDATE accounts SET status = 'delinquent' WHERE account_id = account_id_param;
ELSEIF balance > 1000 THEN
    INSERT INTO history (account_id, description) VALUES (account_id_param, 'High balance');
ELSE
    INSERT INTO history (account_id, description) VALUES (account_id_param, 'Normal balance');
END IF;
```

### WHILE

The `WHILE` statement is used to execute a block of code repeatedly while a specific condition is true.

Example:

```sql
WHILE counter < 10 DO
    INSERT INTO records (value) VALUES (counter);
    SET counter = counter + 1;
END WHILE;
```

### CASE

The `CASE` statement is used to execute different actions based on the value of a variable or expression.

Example:

```sql
CASE account_type
    WHEN 'checking' THEN
        UPDATE accounts SET monthly_fee = 10 WHERE account_id = account_id_param;
    WHEN 'savings' THEN
        UPDATE accounts SET monthly_fee = 5 WHERE account_id = account_id_param;
    ELSE
        UPDATE accounts SET monthly_fee = 0 WHERE account_id = account_id_param;
END CASE;
```

### REPEAT

The `REPEAT` statement is used to execute a block of code until a specific condition is met.

Example:

```sql
REPEAT
    SET counter = counter + 1;
    INSERT INTO logs (message) VALUES ('Iteration ' + counter);
UNTIL counter >= 10
END REPEAT;
```

### LOOP, LEAVE, ITERATE

`LOOP` is used to create an infinite loop, `LEAVE` is used to exit the loop, and `ITERATE` is used to continue to the next iteration.

Example:

```sql
DECLARE counter INT DEFAULT 0;

main_loop: LOOP
    IF counter >= 10 THEN
        LEAVE main_loop;
    END IF;
    
    IF counter = 5 THEN
        ITERATE main_loop;
    END IF;
    
    INSERT INTO records (value) VALUES (counter);
    SET counter = counter + 1;
END LOOP main_loop;
```

### CURSOR

A cursor is a control structure used to traverse the records of a result set. It's useful when you want to manipulate each row of a result individually.

Example:

```sql
DECLARE done INT DEFAULT 0;
DECLARE vAge INT;
DECLARE cur_student CURSOR FOR SELECT age FROM student;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

OPEN cur_student;
FETCH cur_student INTO vAge;

WHILE done = 0 DO
    -- Perform operations with vAge here
    FETCH cur_student INTO vAge;
END WHILE;

CLOSE cur_student;
```
