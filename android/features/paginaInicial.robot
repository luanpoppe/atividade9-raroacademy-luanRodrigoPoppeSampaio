*** Settings ***
Resource    ../utils/config.robot

Test Setup        Abrir App
Test Teardown     Teardown    

*** Test Cases ***
Aplicativo deverá mostrar mostrar informações pessoais do usuário logado
    Quando acesso a página inicial do Aplicativo
    Então deve aparecer na tela algumas informações pessoais do usuário

Funcionalidade de indicar amigos deve mostrar tela condinzente
    Quando acesso a página inicial do Aplicativo
    E clico no botão de indicar amigos
    Então devo ver as informações sobre a funcionalidade de indicação e amigos

Usuário deve conseguir acessar a funcionalidade de pix 
    Quando acesso a página inicial do Aplicativo
    E acesso a funcionalidade do pix
    Então deve ser possível ver as informações sobre a funcionalidade de pix

Usuário deve conseguir acessar a seção de pagar
    Quando acesso a página inicial do Aplicativo
    E acesso a seção de pagar
    Então deve ser possível ver as informações sobre a seção de pagar

Usuário deve conseguir acessar a seção de transferir
    Quando acesso a página inicial do Aplicativo
    E acesso a seção de transferir
    Então deve ser possível ver as informações sobre a seção de transferir
    E digitar um valor a ser transferido

Usuário deve conseguir acessar a seção de depositar
    Quando acesso a página inicial do Aplicativo
    E acesso a seção de depositar
    Então deve ser possível ver as informações sobre depósitos