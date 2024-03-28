# Linguagem de Controle de Dados (DCL)

A Linguagem de Controle de Dados (DCL) inclui comandos essenciais para definir as permissões de acesso e o controle de segurança no banco de dados. Esses comandos permitem aos administradores de banco de dados controlar quem pode acessar e manipular os dados armazenados, desempenhando um papel fundamental na segurança do banco de dados.

Os principais comandos DCL em SQL são:

- **GRANT**: Concede permissões de acesso a usuários ou papéis do banco de dados.
- **REVOKE**: Revoga permissões de acesso previamente concedidas a usuários ou papéis do banco de dados.

## Introdução

Antes de explorar os comandos específicos, é importante entender o papel da Linguagem de Controle de Dados no gerenciamento de banco de dados. A DCL é responsável por definir e regular as permissões de acesso, garantindo que apenas usuários autorizados possam realizar determinadas operações no banco de dados.

## Criação de Usuário

O comando `CREATE USER` é utilizado para criar um novo usuário no banco de dados, especificando seu nome, host de acesso e senha.

```sql
CREATE USER '<nome>'@'<host>' IDENTIFIED BY '<senha>';
```

- `<nome>`: Nome do usuário.
- `<host>`: Local de acesso permitido.
- `<senha>`: Senha de acesso.

### Exemplo

```sql
CREATE USER 'aluno'@'localhost' IDENTIFIED BY '123456';
```

Este exemplo cria um usuário chamado 'aluno' que só pode acessar o banco de dados de localhost, com a senha '123456'.

## Remoção de Usuário

O comando `DROP USER` é utilizado para remover um usuário existente no banco de dados.

```sql
DROP USER '<nome>'@'<host>';
```

### Exemplo

```sql
DROP USER 'aluno'@'%';
```

Este exemplo remove o usuário 'aluno' de qualquer host.

## Alteração de Usuário

O comando `ALTER USER` permite modificar as propriedades de um usuário existente, como senha e estado da conta.

```sql
ALTER USER '<nome>'@'<host>' [ALTERAÇÕES];
```

### Exemplo

```sql
ALTER USER 'aluno'@'localhost' IDENTIFIED BY 'caderno' PASSWORD EXPIRE;
```

Este exemplo altera a senha do usuário 'aluno' e a expira, exigindo que uma nova senha seja definida no próximo login.

## Consulta de Usuário

Para visualizar informações sobre os usuários existentes, pode-se utilizar consultas SQL simples.

```sql
SELECT HOST, USER FROM MYSQL.USER;
```

Para ver os privilégios de um usuário específico:

```sql
SHOW GRANTS FOR 'aluno'@'%';
```

## Definindo Privilégios

O comando `GRANT` é usado para conceder permissões específicas a um usuário em um banco de dados ou tabela.

```sql
GRANT <privilégio>[(campo_tabela)] ON <nome_db>.<nome_tabela> TO '<usuario>'@'<host>';
```

### Exemplo

```sql
GRANT SELECT ON DBTESTE.FUNCIONARIO TO 'aluno'@'%';
```

Este exemplo concede ao usuário 'aluno' permissão para selecionar dados da tabela FUNCIONARIO no banco de dados DBTESTE.

## Revogação de Privilégios

O comando `REVOKE` é usado para remover permissões previamente concedidas a um usuário.

```sql
REVOKE <privilégio>[(campo_tabela)] ON <nome_db>.<nome_tabela> FROM '<usuario>'@'<host>';
```

### Exemplo

```sql
REVOKE SELECT ON DBTESTE.FUNCIONARIO FROM 'aluno'@'%';
```

Este exemplo revoga a permissão de seleção de dados da tabela FUNCIONARIO do usuário 'aluno'.

## Atualização de Privilégios

Após conceder ou revogar privilégios, é necessário atualizar as tabelas de privilégios do servidor para que as alterações tenham efeito.

```sql
FLUSH PRIVILEGES;
```

Este comando atualiza a tabela de privilégios do servidor em tempo de execução.
