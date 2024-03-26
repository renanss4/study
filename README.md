# SQL - Study

SQL (Structured Query Language) is a programming language used to manage and manipulate relational databases. It is widely employed for performing queries, insertions, updates, and deletions of data in a database, as well as for defining and modifying the structure of tables and relationships within the database.

## How to Install?

> **For Linux Users!**
>
> I consider MySQL to be the best for learning, so I will proceed with it for this study.

1. Update Packages

```bash
sudo apt update && sudo apt upgrade -y
```

2. Install MySQL Server

```bash
sudo apt install mysql-server
```

3. Check MySQL Status

```bash
sudo systemctl status mysql
```

4. Start, Stop, and Restart MySQL (Optional)

    - To start MySQL

    ```bash
    sudo systemctl start mysql
    ```

    - To stop MySQL

    ```bash
    sudo systemctl stop mysql
    ```

    - To restart MySQL

    ```bash
    sudo systemctl restart mysql
    ```

5. Access MySQL

```bash
sudo mysql -u root -p
```

## Main Functionalities:

- **[DDL:](./sql/ddl/DDL.md)** Data Definition Language;

- **[DML:](./sql/dml/DML.md)** Data Manipulation Language;

- **[DQL:](./sql/dql/DQL.md)** Data Query Language;

- **[DCL:](./sql/dcl/DCL.md)** Data Control Language;

- **[DTL:](./sql/dtl/DTL.md)** Data Transaction Language.

## Other Docs

### [A Little Knowledge (maybe not)](./docs/a_little_knowledge.md)

### [10 Steps to Conceptual Data Modeling](./docs/10_steps_to_conceptual_data_modeling.md)
