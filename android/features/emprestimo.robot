*** Settings ***
Resource    ../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    

*** Test Cases ***
Usuário deve conseguir acessar a seção de empréstimo
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando acessar a seção de empréstimos
    Então deve ser possível ver as informações sobre empréstimo

Usuário que não possui empréstimos deve ver uma mensagem o informando disso na seção de empréstimos
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando acessar a seção de empréstimos
    Então deve ser possível ver a mensagem informando que o usuário não possui empréstimos

Usuário deve ver ao entrar no aplicativo a opção informando quanto ele tem disponível para empréstimo 
    Quando usuário acessar a página inicial do Aplicativo
    Então deve ser possível visualizar a mensagem informando quanto ele tem disponível para empréstimo

Ao clicar na mensagem que informa o máximo de empréstimo que pode realizar, usuário deve ser levado à tela de empréstimo
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando clicar na mensagem informando o quanto tem disponível para empréstimo
    Então deve ser possível ver as informações sobre empréstimo

Usuário deve poder acessar a seção de empréstimo acessando a funcionalidade vista ao scrollar pra baixo
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando acessar a funcionalidade de empréstimo vista ao scrollar para baixo
    Então deve ser possível ver as informações sobre empréstimo

Usuário deve conseguir retornar da seção de pix para a página inicial ao clicar no X
    Dado que o usuário acessou a seção de empréstimos
    Quando clicar no botão de voltar da seção de empréstimo
    Então o aplicativo deve retornar à sua página inicial