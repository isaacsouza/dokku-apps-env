# dokku-apps-link

Plugim Dokku para facilitar validação de configuração de variáveis de ambiente e link entre aplicações.

## Validação de Variáveis de Ambiente

Para validar variaveis de ambientes, basta incluir na raiz do projeto o arquivo:

- requirements.env 

Ele deve conter o nome das variaveis de ambientes que devem estar configuradas. (uma variavel por linha).
Exemplos para requirements.env:

```
DATABASE_URL
DATABASE_URL:Url da conexão com a base de dados.
```

## Criando link entre aplicações com url em variável de ambiente

Para injetar automaticamente o link de URL de outras apps, basta incluir na raiz do projeto o arquivo:

- requirements.app 

Ele deve conter o nome das apps as quais devem ser criados os links. (uma app por linha)
Para as apps existentes a variável é criada com o nome da aplicação a qual se depende, em maísculo, com sufixo _URL ao fim do nome.

Exemplos para requirements.app:

```
cep
cep:Aplicação de consulta de CEP.
```

## Validação de Variáveis de Ambiente

Para injetar manualmente na aplicação dependente, basta executar o comando abaixo:

```
$ dokku apps:link cep myapp
```

## Instalação

```shell
# dokku 0.4.x

$ dokku plugin:install https://github.com/isaacsouza/dokku-apps-link.git
```


## Commands
```
$ dokku help
    apps:link <app-source> <app-target>       Set in <app-target> variable APP_SOURCE_NAME_URL with access url
    apps:unlink <app-source> <app-target>     Unset in <app-target> APP_SOURCE_NAME_URL

```
