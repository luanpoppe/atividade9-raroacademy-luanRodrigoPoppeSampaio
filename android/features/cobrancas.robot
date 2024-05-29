*** Settings ***
Resource    ../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    

*** Test Cases ***
Usuário deve conseguir acessar a seção de cobranças
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando acessar a seção de cobranças
    Então usuário deve ver a instrução da cobrança
    E deve ser possível digitar qual o número será cobrado

Na seção de cobranças não deve ser possível digitar um valor contendo letras 
    Dado que o usuário acessou a seção de cobranças
    Quando tentar digitar um valor de cobrança contendo letras
    Então as letras digitadas não devem ser consideradas para a cobrança

Na seção cobranças não deve ser possível digitar mais do que 14 números
    Dado que o usuário acessou a seção de cobranças
    Quando tentar digitar um valor de cobrança com mais de 11 números
    Então o número considerado só deverá conter os primeiros 14 valores digitados