*** Settings ***
Resource    ../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    

*** Test Cases ***
Usuário deve poder acessar a seção de investimentos e visualizar as informações sobre tal funcionalidade
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando acessar a funcionalidade de investimentos ao scrollar para baixo
    Então deve ser possível ver as informações sobre investimentos

Usuário deve poder acessar a seção de investimentos clicando no botão de conhecer investimentos
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando acessar a funcionalidade de investimentos clicando no botão de conhecer investimentos ao scrollar para baixo
    Então deve ser possível ver as informações sobre investimentos