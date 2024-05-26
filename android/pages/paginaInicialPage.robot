*** Settings ***
Library    AppiumLibrary
Resource    ../base.robot
*** Variables ***
${boasVindas}    xpath=//android.view.View[@content-desc="Olá, Breno Freitas"]
${infoSaldoConta}    xpath=//android.view.View[contains(@content-desc, 'Conta')]
${botaoAcessarIndicarAmigos}    xpath=//android.widget.ScrollView/android.widget.Button[3]
${botaoPix}    xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]/android.widget.Button[1]
${botaoPagar}    xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]/android.widget.Button[2]
${botaoTransferir}    xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]/android.widget.Button[3]
${botaoDepositar}    xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]/android.widget.Button[4]
${mensagemDisponivelEmprestimo}    xpath=//android.view.View[contains(@content-desc, "disponíveis para empréstimo.")]
${mensagemFaturaAtual}    xpath=//android.view.View[contains(@content-desc, "Fatura atual")]

${secaoBotoes}    xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]
${botaoMeusCartoes}    xpath=//android.view.View[@content-desc="Meus cartões"]



*** Keywords ***
Quando acesso a página inicial do Aplicativo
    Wait Until Page Contains Element    ${secaoBotoes}
    Wait Until Page Contains Element    ${botaoMeusCartoes}
    Wait Until Page Contains Element    ${mensagemDisponivelEmprestimo}


Então deve aparecer na tela algumas informações pessoais do usuário
    Page Should Contain Element    ${boasVindas}
    Page Should Contain Element    ${infoSaldoConta}
    ${texto} =    Get Element Attribute    ${mensagemDisponivelEmprestimo}    content-desc
    Should Contain    ${texto}    Você tem R$
    ${texto} =    Get Element Attribute    ${mensagemFaturaAtual}    content-desc
    Should Contain    ${texto}    Cartão de Crédito
    Should Contain    ${texto}    Limite disponível R$

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