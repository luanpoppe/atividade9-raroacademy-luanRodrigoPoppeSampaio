*** Settings ***
Library    AppiumLibrary
Resource    ../base.robot
*** Variables ***
${telaPagar}        xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View
${botaoPagarComPix}    xpath=//android.view.View[@content-desc="Pagar com Pix\nLeia um QR Code ou cole o código."]
${botaoPagarFaturaCartao}    xpath=//android.view.View[@content-desc="Pagar fatura do cartão\nLibera o limite do seu Cartão de Crédito."]
${botaoPagarBoleto}    xpath=//android.view.View[@content-desc="Pagar um boleto\nContas de luz, água, etc."]

*** Keywords ***

Então deve ser possível ver as informações sobre a seção de pagar
    Wait Until Page Contains Element    ${telaPagar}
    Page Should Contain Element    ${telaPagar}
    Page Should Contain Element    ${botaoPagarComPix}
    Page Should Contain Element    ${botaoPagarFaturaCartao}
    Page Should Contain Element    ${botaoPagarBoleto}