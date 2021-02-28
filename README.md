# elixir-nlw
Desenvolvimento de aplicação Elixir durante a quarta edição do evento Next Level Week.

Requisitos:
- Docker

Container com banco de dados Postgres e ambiente de desenvolvimento Elixir provisionados via Devcontainer do VS Code. Para iniciar os containers basta pressionar o símbolo azul que fica no canto esquerdo inferior da IDE e selecionar em "Remote-Containers: Reopen in container", ou utilizar o atalho Ctrl+Shift+p, digitar "remote-containers" e ir na opção "Remote-Containers: Reopen in container". Para mais detalhes, acesse a documentação do [Remote Containers](https://code.visualstudio.com/docs/remote/containers).

O terminal do container Elixir fica disponível assim que é iniciado o Remote Containers. Para acessar o container do banco de dados, utilize o comando:
```bash
docker exec -it postgres bash
```

## Comandos utilizados
```bash
mix phx.new rocketpay --no-webpack --no-html # starts a phoenix project
mix ecto.create # creates a database
mix ecto.drop # drops a database
mix ecto.migrate # runs project migrations
mix ecto.setup # alias to ecto.create -> ecto.migrate -> run seeds.exs
mix ecto.gen.migration <migration_name> # generates table scheme
mix deps.get # installs dependencies
mix credo gen.config # generates credo lint configs
mix phx.server # starts application web server
mix test [--cover] # run unit tests
mix coveralls.html # generate test coverage (needs excoveralls dep)

iex [-S mix] # opens elixir REPL

recompile # compile changes when using iex
```

TO-DO além do ensinado:

- [ ] Implementar extrato bancário
- [ ] Implementar obter saldo
- [ ] Implementar obter extrato por período
- [ ] Implementar transferência por email (PIX? rsrs)
- [ ] Implementar transferencia agendada
- [ ] Editar cadastro
- [ ] Cheque especial
- [ ] Autenticação admin (basic_auth) vs autenticação correntista (bearer_auth)
- [ ] Cobertura de teste de 100%
