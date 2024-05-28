*** Settings ***
Library    AppiumLibrary
Library    XML
Resource    ../base.robot
*** Variables ***
${telaCartaoCredito}        xpath=//android.widget.ScrollView
${tituloCartaoCredito}    xpath=//android.view.View[@content-desc="Fatura atual"]
${limiteDisponivel}    xpath=//android.view.View[contains(@content-desc,"Limite disponível R$")]

${botoesHeader}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.Button
${botaoVoltarCartaoCredito}    ${botoesHeader}[1]
${botaoPesquisarCartaoCredito}    ${botoesHeader}[2]
${botaoAjudaCartaoCredito}    ${botoesHeader}[3]
${botaoPagarFaturaCartaoCredito}    xpath=//android.view.View[@content-desc="Pagar fatura"]
${botaoResumoFaturasCartaoCredito}    xpath=//android.view.View[@content-desc="Resumo de faturas"]
${botaoAjustarLimitesCartaoCredito}    xpath=//android.view.View[@content-desc="Ajustar limites"]
${botaoCartaoVirtualCartaoCredito}    xpath=//android.view.View[@content-desc="Cartão virtual"]
${botaoBloquearCartaoCredito}    xpath=//android.view.View[@content-desc="Bloquear cartão"]
${botaoIndicarAmigosCartaoCredito}    xpath=//android.view.View[@content-desc="Indicar amigos"]

*** Keywords ***
Aguarda a página de cobrança carregar
    Wait Until Page Contains Element    ${telaCartaoCredito}
    Wait Until Page Contains Element    ${tituloCartaoCredito}

Swipe opcoes cartao de credito
    Swipe para esquerda X    20    80

Então deve ser possível ver informações sobre a fatura atual
    Aguarda a página de cobrança carregar
    Page Should Contain Element    ${telaCartaoCredito}
    Checar se elementos estão visíveis    ${tituloCartaoCredito}    ${limiteDisponivel}

E deve ser possível ver as opções referentes à fatura e cartões de crédito
    Aguarda a página de cobrança carregar
    Checar se elementos estão habilitados e visíveis    ${botaoPagarFaturaCartaoCredito}    ${botaoResumoFaturasCartaoCredito}    ${botaoAjustarLimitesCartaoCredito}    ${botaoCartaoVirtualCartaoCredito}

    Swipe opcoes cartao de credito
    Checar se elementos estão habilitados e visíveis    ${botaoBloquearCartaoCredito}    ${botaoIndicarAmigosCartaoCredito}


E deve ser possível ver o histórico de transferências
    Aguarda a página de cobrança carregar
    Swipe para cima Y    30    50    80

    O atributo do elemento deve conter texto    xpath=//android.widget.ScrollView/*[2]    content-desc    Pagamento recebido\nOntem
    O atributo do elemento deve conter texto    xpath=//android.widget.ScrollView/*[2]    content-desc    Pix
    O atributo do elemento deve conter texto    xpath=//android.widget.ScrollView/*[3]    content-desc    Supermercado\nOntem
    O atributo do elemento deve conter texto    xpath=//android.widget.ScrollView/*[3]    content-desc    Pix
    O atributo do elemento deve conter texto    xpath=//android.widget.ScrollView/*[4]    content-desc    Transferência enviada\nOntem
    O atributo do elemento deve conter texto    xpath=//android.widget.ScrollView/*[4]    content-desc    Pix