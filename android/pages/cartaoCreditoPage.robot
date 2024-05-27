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
    # Wait Until Element Is Visible    ${telaCartaoCredito}

Swipe opcoes cartao de credito
    Swipe para esquerda X    20    80

Então deve ser possível ver informações sobre a fatura atual
    Aguarda a página de cobrança carregar
    # Element Should Be Visible    ${telaCartaoCredito}
    Element Should Be Visible    ${tituloCartaoCredito}
    Element Should Be Visible    ${limiteDisponivel}

E deve ser possível ver as opções referentes à fatura e cartões de crédito
    Aguarda a página de cobrança carregar
    Element Should Be Visible    ${botaoPagarFaturaCartaoCredito}
    Element Should Be Visible    ${botaoResumoFaturasCartaoCredito}
    Element Should Be Visible    ${botaoAjustarLimitesCartaoCredito}
    Element Should Be Visible    ${botaoCartaoVirtualCartaoCredito}
    Swipe opcoes cartao de credito
    Element Should Be Visible    ${botaoBloquearCartaoCredito}
    Element Should Be Visible    ${botaoIndicarAmigosCartaoCredito}


E deve ser possível ver o histórico de transferências
    Aguarda a página de cobrança carregar
    # Swipe By Percent    50    80    50    20
    Swipe para cima Y    30    50    80
    Sleep    3
    ${historico1} =    Get Element Attribute    xpath=//android.widget.ScrollView/*[2]    content-desc
    ${historico2} =    Get Element Attribute    xpath=//android.widget.ScrollView/*[3]    content-desc
    ${historico3} =    Get Element Attribute    xpath=//android.widget.ScrollView/*[4]    content-desc
    Should Contain    ${historico1}    Pagamento recebido\nOntem
    Should Contain    ${historico1}    Pix
    Should Contain    ${historico2}    Supermercado\nOntem
    Should Contain    ${historico2}    Pix
    Should Contain    ${historico3}    Transferência enviada\nOntem
    Should Contain    ${historico3}    Pix



# Então usuário deve ver a instrução da cobrança
#     Wait Until Page Contains Element    ${telaCobranca}
#     Page Should Contain Element    ${telaCobranca}
#     ${hint}=    Get Element Attribute    ${telaCobranca}    hint
#     Should Contain    ${hint}    Qual valor você quer receber?\nNão especificar um valor >

# E deve ser possível digitar qual o número será cobrado
#     Input Text    ${telaCobranca}    5560
#     Wait Until Keyword Succeeds    4    1    Element Text Should Be    ${telaCobranca}    R$ 55,60

# E usuário tenta digitar um valor de cobrança contendo letras
#     Wait Until Page Contains Element    ${telaTransferir}
#     Input Text    ${telaCobranca}    55abc60
# Então as letras digitadas não devem ser consideradas para a cobrança
#     Wait Until Keyword Succeeds    4    1    Element Text Should Be    ${telaCobranca}    R$ 55,60

# E usuário tenta digitar um valor de cobrança com mais de 11 números
#     Wait Until Page Contains Element    ${telaCobranca}
#     Input Text    ${telaCobranca}    12345678901234
#     Input Text    ${telaCobranca}    5678

# Então o número considerado só irá conter os primeiros 14 valores digitados
#     Wait Until Keyword Succeeds    4    1    Element Text Should Be    ${telaCobranca}    R$ 123.456.789.012,34