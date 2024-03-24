# SQL - Study

SQL (Structured Query Language) é uma linguagem de programação utilizada para gerenciar e manipular bancos de dados relacionais. É amplamente empregada para realizar consultas, inserções, atualizações e exclusões de dados em um banco de dados, além de ser utilizada para definir e modificar a estrutura das tabelas e relacionamentos dentro do banco de dados.

## Como instalar?

> Para usuários de Linux!
>
> Eu considero o DB MySQL o melhor para aprendizado, então seguirei com ele para esse estudo.

1. Atualizar pacotes

```bash
sudo apt update && sudo apt upgrade -y
```

2. Instalar o MySQL Server

```bash
sudo apt install mysql-server
```

3. Verificar status do MySQL

```bash
sudo systemctl status mysql
```

4. Iniciar, Parar e Reiniciar o MySQL (Opcional)

    - Para iniciar o MySQL

    ```bash
    sudo systemctl start mysql
    ```

    - Para parar o MySQL

    ```bash
    sudo systemctl stop mysql
    ```

    - Para reiniciar o MySQL

    ```bash
    sudo systemctl restart mysql
    ```

5. Acessar o MySQL

```bash
sudo mysql -u root -p
```

## Funcionalidades principais:

- **[DDL:](docs/DDL.md)** Linguagem de Definição de Dados;

- **[DML:](docs/DML.md)** Linguagem de Manipulação de Dados;

- **[DQL:](docs/DQL.md)** Linguagem de Consulta de Dados;

- **[DCL:](docs/DCL.md)** Linguagem de Controle de Dados;

- **[DTL:](docs/DTL.md)** Linguagem de Transação de Dados.

## Diagramas entidade relacionamento (DER)

- 
