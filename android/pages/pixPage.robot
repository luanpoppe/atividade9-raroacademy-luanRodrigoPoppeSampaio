*** Settings ***
Library    AppiumLibrary
Resource    ../base.robot
*** Variables ***
${telaPix}        xpath=//android.widget.ImageView[@content-desc="Minha área Pix\nTudo o que você precisa para pagar, transferir ou cobrar.\nPagar\nTransferir\nCobrar"]
${botaoPagarPix}    ${telaPix}/android.widget.Button[2]
${botaoTransferirPix}    ${telaPix}/android.widget.Button[3]
${botaoCobrarPix}    ${telaPix}/android.widget.Button[4]
${botaoMinhasChaves}    xpath=//android.view.View[@content-desc="Minhas chaves"]
${botaoMeuLimitePix}    xpath=//android.view.View[@content-desc="Meu limite Pix"]
${botaoMeAjuda}    xpath=//android.view.View[@content-desc="Me ajuda"]
${botaoVoltarPix}    xpath=//android.widget.ImageView[@content-desc="Minha área Pix\nTudo o que você precisa para pagar, transferir ou cobrar.\nPagar\nTransferir\nCobrar"]/android.widget.Button[1]


*** Keywords ***

Então deve ser possível ver as informações sobre a funcionalidade de pix
    Wait Until Page Contains Element    ${telaPix}
    Checar se elementos estão habilitados e visíveis    ${botaoPagarPix}    ${botaoTransferirPix}    ${botaoCobrarPix}    ${botaoMinhasChaves}    ${botaoMeuLimitePix}    ${botaoMeAjuda}

E clico no botão X
    Wait Until Page Contains Element    ${telaPix}
    Click Element    ${botaoVoltarPix}

E scrollo para baixo
    Wait Until Page Contains Element    ${telaPix}
    Swipe By Percent    50    20    50    80