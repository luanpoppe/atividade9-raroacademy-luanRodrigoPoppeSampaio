*** Settings ***
Resource    ../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    

*** Test Cases ***
Usuário deve conseguir acessar a seção de transferir e digitar um valor a ser transferido
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando acessar a seção de transferir
    Então deve ser possível ver as informações sobre a seção de transferir
    E deve ser possível digitar um valor a ser transferido

Usuário não deve conseguir digitar um valor a ser transferido com mais de 14 números
    Dado que o usuário acessou a seção de transferir
    Quando tentar digitar um valor com mais de 14 dígitos
    Então só os primeiros 14 dígitos devem ser mostrados no valor para transferência

Usuário não deve conseguir digitar letras no valor a ser transferido
    Dado que o usuário acessou a seção de transferir
    Quando tentar digitar letras como valor a ser transferido
    Então as letras digitadas não devem ser consideradas para a transferência