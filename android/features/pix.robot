*** Settings ***
Resource    ../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    

*** Test Cases ***
Usuário deve conseguir acessar a funcionalidade de pix 
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando acessar a funcionalidade do pix
    Então deve ser possível ver as informações sobre a funcionalidade de pix

Usuário deve conseguir retornar da seção de pix para a página inicial ao clicar no X
    Dado que o usuário acessou a seção de pix
    Quando clicar no botão X    ${botaoVoltarPix}
    Então o aplicativo deve retornar à sua página inicial

Usuário deve conseguir retornar da seção de pix para a página inicial ao scrollar para baixo
    Dado que o usuário acessou a seção de pix
    Quando scrollar para baixo    ${telaPix}
    Então o aplicativo deve retornar à sua página inicial