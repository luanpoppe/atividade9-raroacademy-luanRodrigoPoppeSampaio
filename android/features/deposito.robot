*** Settings ***
Resource    ../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    

*** Test Cases ***
Usuário deve conseguir acessar a seção de depositar
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando acessar a seção de depositar
    Então deve ser possível ver as informações sobre depósitos