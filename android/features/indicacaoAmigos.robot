*** Settings ***
Resource    ../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    

*** Test Cases ***
Funcionalidade de indicar amigos deve mostrar tela condinzente
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando clicar no botão de indicar amigos
    Então deve ser possível ver as informações sobre a funcionalidade de indicação de amigos

Usuário deve conseguir acessar a seção de indicar para amigos através da seção de descubra mais ao scrollar o app para todo para baixo
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando scrollar para baixo até o final do app
    E clicar na funcionalidade de indicar amigos
    Então deve ser possível ver as informações sobre a funcionalidade de indicação de amigos

Usuário deve conseguir retornar da seção de indicar amigos para a página inicial ao clicar no X
    Dado que o usuário acessou a seção de indicação de amigos
    Quando clicar no botão X    ${botaoVoltarIndicacaoAmigos}
    Então o aplicativo deve retornar à sua página inicial

Usuário deve conseguir retornar da seção de indicar amigos para a página inicial ao scrollar para baixo
    Dado que o usuário acessou a seção de indicação de amigos
    Quando scrollar para baixo    ${telaIndicarAmigos}
    Então o aplicativo deve retornar à sua página inicial