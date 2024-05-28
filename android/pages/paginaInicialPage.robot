*** Settings ***
Library    AppiumLibrary
Resource    ../base.robot
*** Variables ***
${telaInicial}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View
${boasVindas}    xpath=//android.view.View[@content-desc="Olá, Breno Freitas"]
${infoSaldoConta}    xpath=//android.view.View[contains(@content-desc, 'Conta')]
${botaoAcessarIndicarAmigos}    xpath=//android.widget.ScrollView/android.widget.Button[3]
${botaoOcultarValores}    xpath=//android.widget.ScrollView/android.widget.Button[1]
${botaoPix}    xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]/android.widget.Button[1]
${botaoPagar}    xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]/android.widget.Button[2]
${botaoTransferir}    xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]/android.widget.Button[3]
${botaoDepositar}    xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]/android.widget.Button[4]
${botaoEmprestimo}    xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]/android.widget.Button[5]

# Próximos botões só funcionam se for realizado o swipe antes com o "Swipe dos botões iniciais"
${botaoRecargaCelular}    xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]/android.widget.Button[2]
${botaoCobrar}    xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]/android.widget.Button[3]
${botaoDoacao}    xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]/android.widget.Button[4]
${botaoEncontrarAtalhos}    xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]/android.widget.Button[5]

${mensagemDisponivelEmprestimo}    xpath=//android.view.View[contains(@content-desc, "disponíveis para empréstimo.")]
${mensagemFaturaAtual}    xpath=//android.view.View[contains(@content-desc, "Cartão de Crédito\nFatura atual")]
${mensagemPlanosFuturos}    xpath=//android.view.View[@content-desc="Conquiste planos futuros: conheça as opções para guardar dinheiro."]

${secaoBotoes}    xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]
${botaoMeusCartoes}    xpath=//android.view.View[@content-desc="Meus cartões"]

# Elementos do Descubra Mais
${tituloDescubraMais}    xpath=//android.view.View[@content-desc="Descubra mais"]
${informacoesWhatsapp}    xpath=//android.view.View[@content-desc="WhatsApp\nNovo\nPagamentos seguros, rápidos e sem tarifa. A experiência Nubank sem nem sair da conversa."]
${informacoesIndiqueSeusAmigos}    xpath=//android.view.View[@content-desc="Indique seus amigos\nMostre aos seus amigos como é fácil ter uma vida sem burocracia."]



*** Keywords ***

Swipe dos botões iniciais
    Swipe By Percent    75    40    10    40
    Swipe By Percent    75    40    10    40
    Wait Until Page Contains    Encontrar atalhos

Clicar em Recarga de Celular
    Swipe dos botões iniciais
    Click Element    xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]/android.widget.Button[2]

Clicar em cobrar
    Swipe dos botões iniciais
    Click Element    ${botaoCobrar}

E tento visualizar todos os botões do carrousel de botões
    Swipe dos botões iniciais

Acessar a seção de investimentos
    Swipe para cima Y
    Set Test Variable    ${botaoInvestimentos}    xpath=//android.view.View[@content-desc="Investimentos\nA revolução roxa começou. Invista de maneira simples, sem burocracia e 100% digital."]
    Wait Until Element Is Visible    ${botaoInvestimentos}
    Click Element    ${botaoInvestimentos}

Acessar a seção de seguro de vida
    Swipe para cima Y
    Click Element    xpath=//android.view.View[@content-desc="Seguro de vida\nConheça Nubank Vida: um seguro simples e que cabe no bolso."]

E clico no botão X
    [Arguments]    ${elemento}
    Wait Until Page Contains Element    ${elemento}
    Click Element    ${elemento}

E scrollo para baixo
    [Arguments]    ${elementoAguardado}
    Wait Until Page Contains Element    ${elementoAguardado}
    Swipe By Percent    50    20    50    80

# BDD
Quando acesso a página inicial do Aplicativo
    Wait Until Page Contains Element    ${secaoBotoes}
    Wait Until Page Contains Element    ${botaoMeusCartoes}
    Wait Until Page Contains Element    ${mensagemDisponivelEmprestimo}
    Wait Until Page Contains Element    ${telaInicial}


Então deve aparecer na tela algumas informações pessoais do usuário
    Checar se elementos estão visíveis    ${boasVindas}    ${infoSaldoConta}

    O atributo do elemento deve conter texto    ${mensagemFaturaAtual}    content-desc    Limite disponível R$

E clico no botão de indicar amigos
    Click Element    ${botaoAcessarIndicarAmigos}

E acesso a funcionalidade do pix
    Click Element    ${botaoPix}

E acesso a seção de pagar
    Click Element    ${botaoPagar}

E acesso a seção de transferir
    Click Element    ${botaoTransferir}

E acesso a seção de depositar
    Click Element    ${botaoDepositar}

E acesso a seção de empréstimos
    Click Element    ${botaoEmprestimo}

E acesso a seção de recarga de celular
    Clicar em Recarga de Celular

E acesso a seção de cobranças
    Clicar em cobrar

Então deve ser possível ver a funcionalidade de doação
    Wait Until Page Contains Element    ${botaoDoacao}
    Checar se elementos estão habilitados e visíveis    ${botaoDoacao}
    Page Should Contain Text    Doação
Então deve ser possível ver a funcionalidade de encontrar atalhos
    Wait Until Page Contains Element    ${botaoEncontrarAtalhos}
    Checar se elementos estão habilitados e visíveis    ${botaoEncontrarAtalhos}
    Page Should Contain Text    Encontrar atalhos

Então deve ser possível visualizar a funcionalidade "Meus cartões"
    Wait Until Page Contains Element    ${botaoMeusCartoes}
    Checar se elementos estão habilitados e visíveis    ${botaoMeusCartoes}


Então deve ser possível visualizar a mensagem informando quanto ele tem disponível para empréstimo
    Checar se elementos estão habilitados e visíveis    ${mensagemDisponivelEmprestimo}
    O atributo do elemento deve conter texto    ${mensagemDisponivelEmprestimo}    content-desc    Você tem R$

E clico na mensagem informando o quanto o usuário tem disponível para empréstimo
    Wait Until Element Is Visible    ${mensagemDisponivelEmprestimo}
    Click Element    ${mensagemDisponivelEmprestimo}

E procuro a mensagem de opções para guardar dinheiro
    Swipe para esquerda X    25    67

Então deve ser possível visualizar a mensagem em questão
    Wait Until Element Is Visible    ${mensagemPlanosFuturos}
    Page Should Contain Element    ${mensagemPlanosFuturos}

E acesso a funcionalidade que mostra as informações sobre cartão de crédito
    Click Element    ${mensagemFaturaAtual}

E acesso a funcionalidade de empréstimo vista ao scrollar para baixo
    Swipe para cima Y
    Click Element    xpath=//android.view.View[contains(@content-desc,"Empréstimo\nValor disponível de até")]

E acesso a funcionalidade de investimentos ao scrollar para baixo
    Acessar a seção de investimentos

E acesso a funcionalidade de investimentos clicando no botão de conhecer investimentos ao scrollar para baixo
    Swipe para cima Y
    Set Local Variable    ${conhecerInvestimentos}    xpath=//android.view.View[@content-desc="Conhecer"]
    Wait Until Page Contains Element    ${conhecerInvestimentos}
    Click Element    ${conhecerInvestimentos}

E scrollo para baixo até o final do app
    Swipe para cima Y
    Swipe para cima Y

Então consigo ver a funcionalidade de seguro de vida
    Set Local Variable    ${seguroDeVida}    xpath=//android.view.View[@content-desc="Seguro de vida\nConheça Nubank Vida: um seguro simples e que cabe no bolso."]
    Wait Until Page Contains Element    ${seguroDeVida}
    Element Should Be Visible    ${seguroDeVida}

Então deve ser possível visualizar a seção de descobrir mais funcionalidades
    Wait Until Page Contains Element    ${tituloDescubraMais}
    Checar se elementos estão visíveis    ${tituloDescubraMais}    ${informacoesWhatsapp}
    Swipe para esquerda X    10    85    90
    Element Should Be Visible    ${informacoesIndiqueSeusAmigos}

E clico na funcionalidade de indicar amigos
    Wait Until Element Is Visible    ${informacoesIndiqueSeusAmigos}
    Swipe para esquerda X    10    85    90
    Click Element    xpath=//android.view.View[@content-desc="Indicar amigos"]

Quando acesso a seção de Pix
    Quando acesso a página inicial do Aplicativo
    E acesso a funcionalidade do pix

Então o usuário deve retornar à página inicial do aplicativo
    Wait Until Page Contains Element    ${secaoBotoes}
    Wait Until Page Contains Element    ${botaoMeusCartoes}
    Wait Until Page Contains Element    ${mensagemDisponivelEmprestimo}

E clico na funcionalidade de mostrar/ocultar valores da tela
    Wait Until Page Contains Element    ${botaoOcultarValores}
    Click Element    ${botaoOcultarValores}

Então os valores da conta e do cartão de crédito devem ser ocultados
    ${texto} =    Get Element Attribute    ${infoSaldoConta}    content-desc
    Should Be Equal    ${texto}    Conta

    ${texto} =    Get Element Attribute    ${mensagemFaturaAtual}    content-desc
    Should Be Equal    ${texto}    Cartão de Crédito\nFatura atual

