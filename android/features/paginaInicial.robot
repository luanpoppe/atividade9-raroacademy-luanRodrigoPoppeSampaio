*** Settings ***
Resource    ../base.robot

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

Usuário deve conseguir acessar a seção de transferir e digitar um valor a ser transferido
    Quando acesso a página inicial do Aplicativo
    E acesso a seção de transferir
    Então deve ser possível ver as informações sobre a seção de transferir
    E digitar um valor a ser transferido

Usuário não deve conseguir digitar um valor a ser transferido com mais de 14 números
    Quando acesso a página inicial do Aplicativo
    E acesso a seção de transferir
    E tento digitar um valor com mais de 14 dígitos
    Então só os primeiros 14 dígitos serão mostrados no valor para transferência

Usuário não deve conseguir digitar letras no valor a ser transferido
    Quando acesso a página inicial do Aplicativo
    E acesso a seção de transferir
    E tento digitar letras como valor a ser transferido
    Então as letras digitadas não devem ser consideradas para a transferência

Usuário deve conseguir acessar a seção de depositar
    Quando acesso a página inicial do Aplicativo
    E acesso a seção de depositar
    Então deve ser possível ver as informações sobre depósitos

Usuário deve conseguir acessar a seção de empréstimo
    Quando acesso a página inicial do Aplicativo
    E acesso a seção de empréstimos
    Então deve ser possível ver as informações sobre empréstimo

Usuário que não possui empréstimos deve ver uma mensagem o informando disso na seção de empréstimos
    Quando acesso a página inicial do Aplicativo
    E acesso a seção de empréstimos
    Então deve ser possível ver a mensagem informando que o usuário não possui empréstimos

Usuário deve conseguir acessar a seção de recarga de celular
    Quando acesso a página inicial do Aplicativo
    E acesso a seção de recarga de celular
    Então usuário deve ver a instrução da recarga
    E deve ser possível digitar qual o número será carregado

Na seção de recarregar celular não deve ser possível digitar um número de telefone contendo letras 
    Quando acesso a página inicial do Aplicativo
    E acesso a seção de recarga de celular
    E usuário tenta digitar um número de telefone contendo letras
    Então as letras digitadas não devem ser consideradas para a recarga

Na seção de recarregar celular não deve ser possível digitar mais do que 11 números
    Quando acesso a página inicial do Aplicativo
    E acesso a seção de recarga de celular
    E usuário tenta digitar um número de telefone com mais de 11 números
    Então o número considerado só irá conter os primeiros 11 valores digitados

Usuário deve conseguir acessar a seção de cobranças
    Quando acesso a página inicial do Aplicativo
    E acesso a seção de cobranças
    Então usuário deve ver a instrução da cobrança
    E deve ser possível digitar qual o número será cobrado

Na seção de cobranças não deve ser possível digitar um valor contendo letras 
    Quando acesso a página inicial do Aplicativo
    E acesso a seção de cobranças
    E usuário tenta digitar um valor de cobrança contendo letras
    Então as letras digitadas não devem ser consideradas para a cobrança

Na seção cobranças não deve ser possível digitar mais do que 14 números
    Quando acesso a página inicial do Aplicativo
    E acesso a seção de cobranças
    E usuário tenta digitar um valor de cobrança com mais de 11 números
    Então o número considerado só irá conter os primeiros 14 valores digitados

Usuário deve poder ver na página inicial a funcionalidade que o leva à seção de doação
    Quando acesso a página inicial do Aplicativo
    E tento visualizar todos os botões do carrousel de botões
    Então deve ser possível ver a funcionalidade de doação

Usuário deve poder ver na página inicial a funcionalidade que o leva à seção de encontrar atalhos
    Quando acesso a página inicial do Aplicativo
    E tento visualizar todos os botões do carrousel de botões
    Então deve ser possível ver a funcionalidade de encontrar atalhos

Usuário deve ver ao entrar no aplicativo a opção de acessar a seção "Meus cartões"
    Quando acesso a página inicial do Aplicativo
    Então deve ser possível visualizar a funcionalidade "Meus cartões"

Usuário deve ver ao entrar no aplicativo a opção informando quanto ele tem disponível para empréstimo 
    Quando acesso a página inicial do Aplicativo
    Então deve ser possível visualizar a mensagem informando quanto ele tem disponível para empréstimo

Ao clicar na mensagem que informa o máximo de empréstimo que pode realizar, usuário deve ser levado à tela de empréstimo
    Quando acesso a página inicial do Aplicativo
    E clico na mensagem informando o quanto o usuário tem disponível para empréstimo
    Então deve ser possível ver as informações sobre empréstimo

Usuário deve conseguir ver a mensagem de opções para guardar dinheiro na página inicial
    Quando acesso a página inicial do Aplicativo
    E procuro a mensagem de opções para guardar dinheiro
    Então deve ser possível visualizar a mensagem em questão

Usuário deve conseguir acessar a seção de cartão de crédito de sua conta
    Quando acesso a página inicial do Aplicativo
    E acesso a funcionalidade que mostra as informações sobre cartão de crédito
    Então deve ser possível ver informações sobre a fatura atual
    E deve ser possível ver as opções referentes à fatura e cartões de crédito
    E deve ser possível ver o histórico de transferências

Usuário deve poder acessar a seção de empréstimo acessando a funcionalidade vista ao scrollar pra baixa
    Quando acesso a página inicial do Aplicativo
    E acesso a funcionalidade de empréstimo vista ao scrollar para baixo
    Então deve ser possível ver as informações sobre empréstimo

Usuário deve poder acessar a seção de investimentos e visualizar as informações sobre tal funcionalidade
    Quando acesso a página inicial do Aplicativo
    E acesso a funcionalidade de investimentos ao scrollar para baixo
    Então deve ser possível ver as informações sobre investimentos

Usuário deve poder acessar a seção de investimentos clicando no botão de conhecer investimentos
    Quando acesso a página inicial do Aplicativo
    E acesso a funcionalidade de investimentos clicando no botão de conhecer investimentos ao scrollar para baixo
    Então deve ser possível ver as informações sobre investimentos

Usuário deve poder ver a funcionalidade de acessar a seção de seguro de vida
    Quando acesso a página inicial do Aplicativo
    E scrollo para baixo até o final do app
    Então consigo ver a funcionalidade de seguro de vida

Usuário deve ver seção de descobrir mais funcionalidades ao fim do aplicativo
    Quando acesso a página inicial do Aplicativo
    E scrollo para baixo até o final do app
    Então deve ser possível visualizar a seção de descobrir mais funcionalidades

Usuário deve conseguir acessar a seção de indicar para amigos através da seção de descubra mais ao scrollar o app para todo para baixo
    Quando acesso a página inicial do Aplicativo
    E scrollo para baixo até o final do app
    E clico na funcionalidade de indicar amigos
    Então devo ver as informações sobre a funcionalidade de indicação e amigos

Usuário deve conseguir retornar de alguma seção para a página inicial ao clicar no X
    Quando acesso a seção de Pix
    E clico no botão X
    Então o usuário deve retornar à página inicial do aplicativo

Usuário deve conseguir retornar de alguma seção para a página inicial scrollar para baixo
    Quando acesso a seção de Pix
    E scrollo para baixo
    Então o usuário deve retornar à página inicial do aplicativo

Usuário deve conseguir omitir os valores pessoais de sua conta ao clicar na funcionalidade de mostrar/ocultar valores
    Quando acesso a página inicial do Aplicativo
    E clico na funcionalidade de mostrar/ocultar valores da tela
    Então os valores da conta e do cartão de crédito devem ser ocultados