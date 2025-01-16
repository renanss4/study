# Data Control Language (DCL)

Data Control Language (DCL) includes essential commands to define access permissions and security control in the database. These commands allow database administrators to control who can access and manipulate the stored data, playing a fundamental role in database security.

The main DCL commands in SQL are:

- **GRANT**: Grants access permissions to users or roles in the database.
- **REVOKE**: Revokes previously granted access permissions to users or roles in the database.

## Introduction

Before exploring the specific commands, it is important to understand the role of Data Control Language in database management. DCL is responsible for defining and regulating access permissions, ensuring that only authorized users can perform certain operations in the database.

## User Creation

The `CREATE USER` command is used to create a new user in the database, specifying their name, access host, and password.

```sql
CREATE USER '<username>'@'<host>' IDENTIFIED BY '<password>';
```

- `<username>`: User's name.
- `<host>`: Allowed access location.
- `<password>`: Access password.

### Example

```sql
CREATE USER 'student'@'localhost' IDENTIFIED BY '123456';
```

This example creates a user named 'student' who can only access the database from localhost, with the password '123456'.

## User Removal

The `DROP USER` command is used to remove an existing user from the database.

```sql
DROP USER '<username>'@'<host>';
```

### Example

```sql
DROP USER 'student'@'%';
```

This example removes the 'student' user from any host.

## User Alteration

The `ALTER USER` command allows modifying the properties of an existing user, such as password and account status.

```sql
ALTER USER '<username>'@'<host>' [MODIFICATIONS];
```

### Example

```sql
ALTER USER 'student'@'localhost' IDENTIFIED BY 'notebook' PASSWORD EXPIRE;
```

This example changes the password of the 'student' user and expires it, requiring a new password to be set upon the next login.

## User Query

To view information about existing users, simple SQL queries can be used.

```sql
SELECT HOST, USER FROM MYSQL.USER;
```

To see the privileges of a specific user:

```sql
SHOW GRANTS FOR 'student'@'%';
```

## Defining Privileges

The `GRANT` command is used to grant specific permissions to a user on a database or table.

```sql
GRANT <privilege>[(table_field)] ON <db_name>.<table_name> TO '<user>'@'<host>';
```

### Example

```sql
GRANT SELECT ON DBTEST.EMPLOYEE TO 'student'@'%';
```

This example grants the 'student' user permission to select data from the EMPLOYEE table in the DBTEST database.

## Revoking Privileges

The `REVOKE` command is used to remove previously granted permissions from a user.

```sql
REVOKE <privilege>[(table_field)] ON <db_name>.<table_name> FROM '<user>'@'<host>';
```

### Example

```sql
REVOKE SELECT ON DBTEST.EMPLOYEE FROM 'student'@'%';
```

This example revokes the data selection permission from the 'student' user for the EMPLOYEE table.

## Updating Privileges

After granting or revoking privileges, it is necessary to update the server's privilege tables for the changes to take effect.

```sql
FLUSH PRIVILEGES;
```

This command updates the server's privilege table at runtime.
