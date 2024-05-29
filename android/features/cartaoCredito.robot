*** Settings ***
Resource    ../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    

*** Test Cases ***
Usuário deve conseguir acessar a seção de cartão de crédito de sua conta
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando acessar a funcionalidade que mostra as informações sobre cartão de crédito
    Então deve ser possível ver informações sobre a fatura atual
    E deve ser possível ver as opções referentes à fatura e cartões de crédito

Usuário deve conseguir acessar o histórico da seção de cartão de crédito de sua conta
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando acessar a funcionalidade que mostra as informações sobre cartão de crédito
    Então deve ser possível ver o histórico de transferências

Usuário deve conseguir retornar da seção de cartão de crédito para a sua página inicial
    Dado que o usuário acessou a seção de cartão de crédito
    Quando clicar na opção de retornar da seção de cartão de crédito
    Então o aplicativo deve retornar à sua página inicial