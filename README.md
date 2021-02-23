# elixir-nlw
Desenvolvimento de aplicação Elixir durante a quarta edição do evento Next Level Week.

Requisitos:
- Docker

Elixir provisionado via Devcontainer do VS Code. Para iniciar o container basta pressionar o símbolo azul que fica no canto esquerdo inferior da IDE e selecionar em "Remote-Containers: Reopen in container", ou utilizar o atalho Ctrl+Shift+p, digitar "remote-containers" e ir na opção "Remote-Containers: Reopen in container". Para mais detalhes, acesse a documentação do [Remote Containers](https://code.visualstudio.com/docs/remote/containers).

Para gerar o container do banco de dados, utilize o seguinte comando:
```bash
docker run --name postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres
```

Para acessar o container do banco de dados, utilize o comando:
```bash
docker exec -it postgres bash
```

## Comandos utilizados
```bash
mix phx.new rocketpay --no-webpack --no-html # starts a phoenix project
mix ecto.setup # compile application
mix deps.get # install dependencies
mix credo gen.config # generate credo lint configs
mix phx.server # starts application web server
```