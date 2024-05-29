*** Settings ***
Resource    ../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    

*** Test Cases ***
Usuário deve poder acessar a seção de conta a partir da tela inicial da aplicação
    Quando usuário acessar a página inicial do Aplicativo
    E clicar na funcionalidade de conta
    Então usuário deve poder acessar informações sobre sua conta

Usuário deve poder acessar a seção de depósito através da tela de conta
    Dado que o usuário acessou a funcionalidade de conta da página inicial
    Quando clicar na funcionalidade para acessar a seção de depósitos
    Então deve ser possível ver as informações sobre depósitos
Usuário deve poder acessar a seção de pagamentos através da tela de conta
    Dado que o usuário acessou a funcionalidade de conta da página inicial
    Quando clicar na funcionalidade para acessar a seção de pagamentos
    Então deve ser possível ver as informações sobre a seção de pagar
Usuário deve poder acessar a seção de transferências através da tela de conta
    Dado que o usuário acessou a funcionalidade de conta da página inicial
    Quando clicar na funcionalidade para acessar a seção de transferências
    Então deve ser possível ver as informações sobre a seção de transferir
    E deve ser possível digitar um valor a ser transferido
Usuário deve poder acessar a seção de empréstimos através da tela de conta
    Dado que o usuário acessou a funcionalidade de conta da página inicial
    Quando clicar na funcionalidade para acessar a seção de empréstimos
    Então deve ser possível ver as informações sobre empréstimo
Usuário deve poder acessar a seção de cobranças através da tela de conta
    Dado que o usuário acessou a funcionalidade de conta da página inicial
    Quando clicar na funcionalidade para acessar a seção de cobranças
    Então usuário deve ver a instrução da cobrança
    E deve ser possível digitar qual o número será cobrado