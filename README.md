
## Busca por CEP

Este projeto é uma aplicação web de busca por CEP que consome a API de CEP do Awesome API e exibe informações como endereço, estado, cidade, coordenadas, entre outros. Além da funcionalidade básica, ele também implementa algumas funcionalidades extras para exibir estatísticas de buscas.



## Tecnologias utilizada

- Ruby on Rails
- Tailwind CSS
- RSpec (para testes)
- Capybara (para testes)
- SQLite3 (para desenvolvimento)




## Funcionalidades

- Busca de informações de um CEP através de uma API externa.
- Exibição dos CEPs mais buscados.
- Contagem de buscas por estado.
- Exibição dos CEPs mais buscados por estado e cidade.


## Instalação

**Pré-requisitos** 

- Ruby 3.0.0 ou superior
- Rails 7.0 ou superior
- Node.js e Yarn
- SQLite3 (para desenvolvimento)

**Passos para Instalação**

1. Clone o repositório:

```bash
  git clone https://github.com/MoisesssDev/Busca_CEP_Rails
  cd Busca_CEP_Rails
```

2. Instale as dependências:

```bash
  bundle install
  yarn install
```

3. Crie e migre o banco de dados:

```bash
  rails db:create
  rails db:migrate
```

4. Inicie o servidor:

```bash
  bin/dev
```
## Detalhamento das Funcionalidades

**Busca por CEP**

A funcionalidade principal da aplicação. O usuário digita um CEP no formulário e a aplicação faz uma requisição para a API de CEP do Awesome API. Os dados retornados são exibidos na mesma página.

**CEPs Mais Buscados**

A aplicação mantém um registro da quantidade de buscas por CEP e exibe os 3 CEPs mais buscados.

**Quantidade de CEPs por Estado**

A aplicação agrupa as buscas por estado e exibe a quantidade total de buscas realizadas em cada estado.

**CEPs Mais Buscados por Estado e Cidade**

A aplicação agrupa as buscas por estado e cidade, e exibe os CEPs mais buscados para cada combinação de estado e cidade.


## Rodando os testes

Para rodar os testes, rode o seguinte comando

1. Instale as dependências de teste:

```bash
  bundle install
```

2. Execute os testes:

```bash
  bundle exec rspec
```