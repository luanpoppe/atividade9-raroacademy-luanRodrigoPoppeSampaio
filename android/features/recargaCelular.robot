*** Settings ***
Resource    ../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    

*** Test Cases ***
Usuário deve conseguir acessar a seção de recarga de celular
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando acessar a seção de recarga de celular
    Então usuário deve ver a instrução da recarga
    E deve ser possível digitar qual o número será carregado

Na seção de recarregar celular não deve ser possível digitar um número de telefone contendo letras 
    Dado que o usuário acessou a seção de recarga de celular
    Quando tentar digitar um número de telefone contendo letras
    Então as letras digitadas não devem ser consideradas para a recarga

Na seção de recarregar celular não deve ser possível digitar mais do que 11 números
    Dado que o usuário acessou a seção de recarga de celular
    Quando tentar digitar um número de telefone com mais de 11 números
    Então o número considerado só deverá conter os primeiros 11 valores digitados

Usuário deve conseguir retornar da seção de recarga de celular para a página inicial ao clicar no X
    Dado que o usuário acessou a seção de recarga de celular
    Quando clicar no botão X    ${botaoVoltarRecargaCelular}
    Então o aplicativo deve retornar à sua página inicial

Usuário deve conseguir retornar da seção de recarga de celular para a página inicial ao scrollar para baixo
    Dado que o usuário acessou a seção de recarga de celular
    Quando scrollar para baixo    ${telaRecargaCelular}
    Então o aplicativo deve retornar à sua página inicial