*** Settings ***
Resource    ../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    

*** Test Cases ***
Aplicativo deverá mostrar mostrar informações pessoais do usuário logado
    Quando usuário acessar a página inicial do Aplicativo
    Então deve aparecer na tela algumas informações pessoais do usuário

Usuário deve poder ver na página inicial a funcionalidade que o leva à seção de doação
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando visualizar todos os botões do carrousel de botões
    Então deve ser possível ver a funcionalidade de doação

Usuário deve poder ver na página inicial a funcionalidade que o leva à seção de encontrar atalhos
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando visualizar todos os botões do carrousel de botões
    Então deve ser possível ver a funcionalidade de encontrar atalhos

Usuário deve ver ao entrar no aplicativo a opção de acessar a seção "Meus cartões"
    Quando usuário acessar a página inicial do Aplicativo
    Então deve ser possível visualizar a funcionalidade "Meus cartões"

Usuário deve conseguir ver a mensagem de opções para guardar dinheiro na página inicial
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando procurar a mensagem de opções para guardar dinheiro
    Então deve ser possível visualizar a mensagem em questão

Usuário deve poder ver a funcionalidade de acessar a seção de seguro de vida
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando scrollar para baixo até o final do app
    Então deve ser possível ver a funcionalidade de seguro de vida

Usuário deve ver seção de descobrir mais funcionalidades ao fim do aplicativo
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando scrollar para baixo até o final do app
    Então deve ser possível visualizar a seção de descobrir mais funcionalidades

Usuário deve conseguir omitir os valores pessoais de sua conta ao clicar na funcionalidade de mostrar/ocultar valores
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando clicar na funcionalidade de mostrar/ocultar valores da tela
    Então os valores da conta e do cartão de crédito devem ser ocultados