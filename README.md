# README

## Como Rodar O projeto

### Primeiro passo: A instalação do Ruby(Windows)

+ Faça o download do ruby por meio desse [link](https://rubyinstaller.org/)
+ Clique no botão de download e selecione a versão recomendada que no meu caso é a Ruby+Devkit 2.6.X (x64)
+ Execute o instalador, se tudo der certo poderemos executar os comandos 
```bash
$ ruby -v
$ gem --version
```

### Segundo Passo: A instalação do yarn

+ Para que algumas funções que serão usadas abaixo funcionarem precisamos do yarn instalado podemos checar se já o temos com o comando:
```bash
$ yarn -v
```
+ Caso não esteja instalado rodamos
```bash
$ npm install -g yarn
```

### Terceiro passo: A instalação do rails

+ Rode o comando:

```bash
$ gem install rails
```

### Quarto passo: Setup das Databases

+ Após a instalação do rails criaremos as databases para o projeto, porém para que a api funcione sem maiores problemas manteremos o nome das databases o mesmo. No caso criaremos uma database chamada "movies_development"(o _development é justificado pelo fato de que o rails geralmente trabalha com databases diferentes dependendo do enviroment, visto que só utilizaremos para development manteremos só essa base de dados) 

### Quinto passo: Instalação e uso do bundler

+ O bundler faz o dowload das gems que serao necessarias para o projeto, sua instalação é feita a partir do comando:
```bash
 $ gem install bundler
```
+ Para executá-lo utilizaremos o comando
```bash
 $ bundle install
 ```
+ Agora temos todas as gems necessarias para o projeto rodar.

### Sexto passo: Migrations e seeders

+ Para migrarmos nossa tabela e executarmos as seeds utilizaremos o comando:

```bash
$ rake db:migrate db:seed
```

+ Assim temos as nossas tables e ja podemos começar a testar!

### Sétimo passo: Servindo o Projeto

+ Para servimos o projeto agora só utilizarmos o comando:

``` bash
 $ rails server
```

+ Agora podemos testar as rotas do projeto pelo localhost:3000/{insira aqui sua rota}
+ as rotas para serem testadas se encontram no arquivo config/routes.rb e explicações de como as mesmas serão usadas se encontram nas controllers localizadas em "app/controllers"


