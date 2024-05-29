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
${botaoConta}    xpath=//android.view.View[contains(@content-desc,"Conta")]

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
    Aguardar para clicar no elemento    xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]/android.widget.Button[2]

Clicar em cobrar
    Swipe dos botões iniciais
    Aguardar para clicar no elemento    ${botaoCobrar}

Quando visualizar todos os botões do carrousel de botões
    Swipe dos botões iniciais

Acessar a seção de investimentos
    Swipe para cima Y
    Set Test Variable    ${botaoInvestimentos}    xpath=//android.view.View[@content-desc="Investimentos\nA revolução roxa começou. Invista de maneira simples, sem burocracia e 100% digital."]
    Aguardar para clicar no elemento    ${botaoInvestimentos}

Acessar a seção de seguro de vida
    Swipe para cima Y
    Aguardar para clicar no elemento    xpath=//android.view.View[@content-desc="Seguro de vida\nConheça Nubank Vida: um seguro simples e que cabe no bolso."]

E clicar no botão X
    [Arguments]    ${elemento}
    Wait Until Page Contains Element    ${elemento}
    Aguardar para clicar no elemento    ${elemento}

Quando clicar no botão X
    [Arguments]    ${elemento}
    E clicar no botão X    ${elemento}

E scrollar para baixo
    [Arguments]    ${elementoAguardado}
    Wait Until Page Contains Element    ${elementoAguardado}
    Swipe By Percent    50    20    50    80

Quando scrollar para baixo
    [Arguments]    ${elementoAguardado}
    E scrollar para baixo    ${elementoAguardado}

# BDD
Quando usuário acessar a página inicial do Aplicativo
    Wait Until Page Contains Element    ${secaoBotoes}
    Wait Until Page Contains Element    ${botaoMeusCartoes}
    Wait Until Page Contains Element    ${mensagemDisponivelEmprestimo}
    Wait Until Page Contains Element    ${telaInicial}

Dado que o usuário acessou a página inicial do Aplicativo
    Quando usuário acessar a página inicial do Aplicativo

Então deve aparecer na tela algumas informações pessoais do usuário
    Checar se elementos estão visíveis    ${boasVindas}    ${infoSaldoConta}

    O atributo do elemento deve conter texto    ${mensagemFaturaAtual}    content-desc    Limite disponível R$

Quando clicar no botão de indicar amigos
    Aguardar para clicar no elemento    ${botaoAcessarIndicarAmigos}

Quando acessar a funcionalidade do pix
    Aguardar para clicar no elemento    ${botaoPix}

Quando acessar a seção de pagar
    Aguardar para clicar no elemento    ${botaoPagar}

Quando acessar a seção de transferir
    Aguardar para clicar no elemento    ${botaoTransferir}

Quando acessar a seção de depositar
    Aguardar para clicar no elemento    ${botaoDepositar}

Quando acessar a seção de empréstimos
    Aguardar para clicar no elemento    ${botaoEmprestimo}

Quando acessar a seção de recarga de celular
    Clicar em Recarga de Celular

Quando acessar a seção de cobranças
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
    Wait Until Element Is Visible    ${mensagemDisponivelEmprestimo}
    Checar se elementos estão habilitados e visíveis    ${mensagemDisponivelEmprestimo}
    O atributo do elemento deve conter texto    ${mensagemDisponivelEmprestimo}    content-desc    Você tem R$

Quando clicar na mensagem informando o quanto tem disponível para empréstimo
    Aguardar para clicar no elemento    ${mensagemDisponivelEmprestimo}

Quando procurar a mensagem de opções para guardar dinheiro
    Swipe para esquerda X    25    67

Então deve ser possível visualizar a mensagem em questão
    Wait Until Element Is Visible    ${mensagemPlanosFuturos}
    Page Should Contain Element    ${mensagemPlanosFuturos}

Quando acessar a funcionalidade que mostra as informações sobre cartão de crédito
    Aguardar para clicar no elemento    ${mensagemFaturaAtual}

Quando acessar a funcionalidade de empréstimo vista ao scrollar para baixo
    Swipe para cima Y
    Aguardar para clicar no elemento    xpath=//android.view.View[contains(@content-desc,"Empréstimo\nValor disponível de até")]

Quando acessar a funcionalidade de investimentos ao scrollar para baixo
    Acessar a seção de investimentos

Quando acessar a funcionalidade de investimentos clicando no botão de conhecer investimentos ao scrollar para baixo
    Swipe para cima Y
    Set Local Variable    ${conhecerInvestimentos}    xpath=//android.view.View[@content-desc="Conhecer"]
    Aguardar para clicar no elemento    ${conhecerInvestimentos}

Quando scrollar para baixo até o final do app
    Swipe para cima Y
    Swipe para cima Y

Então deve ser possível ver a funcionalidade de seguro de vida
    Set Local Variable    ${seguroDeVida}    xpath=//android.view.View[@content-desc="Seguro de vida\nConheça Nubank Vida: um seguro simples e que cabe no bolso."]
    Wait Until Page Contains Element    ${seguroDeVida}
    Element Should Be Visible    ${seguroDeVida}

Então deve ser possível visualizar a seção de descobrir mais funcionalidades
    Wait Until Page Contains Element    ${tituloDescubraMais}
    Checar se elementos estão visíveis    ${tituloDescubraMais}    ${informacoesWhatsapp}
    Swipe para esquerda X    10    85    90
    Element Should Be Visible    ${informacoesIndiqueSeusAmigos}

E clicar na funcionalidade de indicar amigos
    Wait Until Element Is Visible    ${informacoesIndiqueSeusAmigos}
    Swipe para esquerda X    10    85    90
    Aguardar para clicar no elemento    xpath=//android.view.View[@content-desc="Indicar amigos"]

Quando o usuário acessar a seção de Pix
    Quando usuário acessar a página inicial do Aplicativo
    Quando acessar a funcionalidade do pix

Então o aplicativo deve retornar à sua página inicial
    Wait Until Page Contains Element    ${secaoBotoes}
    Wait Until Page Contains Element    ${botaoMeusCartoes}
    Wait Until Page Contains Element    ${mensagemDisponivelEmprestimo}

Quando clicar na funcionalidade de mostrar/ocultar valores da tela
    Aguardar para clicar no elemento    ${botaoOcultarValores}

Então os valores da conta e do cartão de crédito devem ser ocultados
    ${texto} =    Get Element Attribute    ${infoSaldoConta}    content-desc
    Should Be Equal    ${texto}    Conta

    ${texto} =    Get Element Attribute    ${mensagemFaturaAtual}    content-desc
    Should Be Equal    ${texto}    Cartão de Crédito\nFatura atual

Dado que o usuário acessou a funcionalidade de conta da página inicial
    Quando usuário acessar a página inicial do Aplicativo
    E clicar na funcionalidade de conta

Dado que o usuário acessou a seção de transferir
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando acessar a seção de transferir

Dado que o usuário acessou a seção de cobranças
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando acessar a seção de cobranças

Dado que o usuário acessou a seção de pagamentos
    Dado que o usuário acessou a página inicial do Aplicativo
    Quando acessar a seção de pagar