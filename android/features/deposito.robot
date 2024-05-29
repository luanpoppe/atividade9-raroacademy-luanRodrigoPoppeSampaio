*** Settings ***
Resource    ../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    

*** Test Cases ***
Usuário deve conseguir acessar a seção de depositar
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando acessar a seção de depositar
    Então deve ser possível ver as informações sobre depósitos

Usuário deve conseguir retornar da seção de depósito para a página inicial ao clicar no X
    Dado que o usuário acessou a seção de depósitos
    Quando clicar no botão X    ${botaoVoltarDepositos}
    Então o aplicativo deve retornar à sua página inicial

Usuário deve conseguir retornar da seção de depósito para a página inicial ao scrollar para baixo
    Dado que o usuário acessou a seção de depósitos
    Quando scrollar para baixo    ${telaDepositar}
    Então o aplicativo deve retornar à sua página inicial