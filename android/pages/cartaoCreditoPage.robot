*** Settings ***
Library    AppiumLibrary
Library    XML
Resource    ../base.robot
*** Variables ***
${telaCartaoCredito}        xpath=//android.widget.ScrollView
${tituloCartaoCredito}    xpath=//android.view.View[@content-desc="Fatura atual"]
${limiteDisponivel}    xpath=//android.view.View[contains(@content-desc,"Limite disponível R$")]

${botoesHeader}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.Button
${botaoVoltarCartaoCredito}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.Button[1]
${botaoPesquisarCartaoCredito}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.Button[2]
${botaoAjudaCartaoCredito}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.Button[3]
${botaoPagarFaturaCartaoCredito}    xpath=//android.view.View[@content-desc="Pagar fatura"]
${botaoResumoFaturasCartaoCredito}    xpath=//android.view.View[@content-desc="Resumo de faturas"]
${botaoAjustarLimitesCartaoCredito}    xpath=//android.view.View[@content-desc="Ajustar limites"]
${botaoCartaoVirtualCartaoCredito}    xpath=//android.view.View[@content-desc="Cartão virtual"]
${botaoBloquearCartaoCredito}    xpath=//android.view.View[@content-desc="Bloquear cartão"]
${botaoIndicarAmigosCartaoCredito}    xpath=//android.view.View[@content-desc="Indicar amigos"]

*** Keywords ***
Aguarda a página de cartão de crédito carregar
    Wait Until Page Contains Element    ${telaCartaoCredito}
    Wait Until Page Contains Element    ${tituloCartaoCredito}

Swipe opcoes cartao de credito
    Swipe para esquerda X    20    80

Quando clicar na opção de retornar da seção de cartão de crédito
    Aguardar para clicar no elemento    ${botaoVoltarCartaoCredito}

Então deve ser possível ver informações sobre a fatura atual
    Aguarda a página de cartão de crédito carregar
    Page Should Contain Element    ${telaCartaoCredito}
    Checar se elementos estão visíveis    ${tituloCartaoCredito}    ${limiteDisponivel}    ${botaoPesquisarCartaoCredito}    ${botaoAjudaCartaoCredito}

E deve ser possível ver as opções referentes à fatura e cartões de crédito
    Aguarda a página de cartão de crédito carregar
    Checar se elementos estão habilitados e visíveis    ${botaoPagarFaturaCartaoCredito}    ${botaoResumoFaturasCartaoCredito}    ${botaoAjustarLimitesCartaoCredito}    ${botaoCartaoVirtualCartaoCredito}

    Swipe opcoes cartao de credito
    Checar se elementos estão habilitados e visíveis    ${botaoBloquearCartaoCredito}    ${botaoIndicarAmigosCartaoCredito}


Então deve ser possível ver o histórico de transferências
    Aguarda a página de cartão de crédito carregar
    Swipe para cima Y    30    50    80

    O atributo do elemento deve conter texto    xpath=//android.widget.ScrollView/*[2]    content-desc    Pagamento recebido\nOntem
    O atributo do elemento deve conter texto    xpath=//android.widget.ScrollView/*[2]    content-desc    Pix
    O atributo do elemento deve conter texto    xpath=//android.widget.ScrollView/*[3]    content-desc    Supermercado\nOntem
    O atributo do elemento deve conter texto    xpath=//android.widget.ScrollView/*[3]    content-desc    Pix
    O atributo do elemento deve conter texto    xpath=//android.widget.ScrollView/*[4]    content-desc    Transferência enviada\nOntem
    O atributo do elemento deve conter texto    xpath=//android.widget.ScrollView/*[4]    content-desc    Pix