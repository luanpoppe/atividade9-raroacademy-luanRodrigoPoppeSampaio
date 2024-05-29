*** Settings ***
Resource    ../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    

*** Test Cases ***
Usuário deve conseguir acessar a seção de pagar
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando acessar a seção de pagar
    Então deve ser possível ver as informações sobre a seção de pagar

Usuário deve conseguir retornar da seção de pagamentos para a página inicial ao clicar no X
    Dado que o usuário acessou a seção de pagamentos
    Quando clicar no botão X    ${botaoVoltarPagamentos}
    Então o aplicativo deve retornar à sua página inicial

Usuário deve conseguir retornar da seção de pagamentos para a página inicial scrollar para baixo
    Dado que o usuário acessou a seção de pagamentos
    Quando scrollar para baixo    ${telaPagar}
    Então o aplicativo deve retornar à sua página inicial