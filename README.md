# dokku-apps-link
Plugin Dokku para linkar duas aplicações através da criação de variável.
Na aplicação dependente <target> é criado uma variável de ambiente com nome da aplicação <source> a qual target depende.
A variável é criada com o nome da aplicação a qual se depende, em maísculo, com sufixo _URL ao fim do nome.

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
