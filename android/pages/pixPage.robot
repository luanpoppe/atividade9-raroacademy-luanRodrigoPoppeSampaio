*** Settings ***
Library    AppiumLibrary
Resource    ../base.robot
*** Variables ***
${telaPix}        xpath=//android.widget.ImageView[contains(@content-desc,"Minha área Pix")]
${botaoPagarPix}    ${telaPix}/android.widget.Button[2]
${botaoTransferirPix}    ${telaPix}/android.widget.Button[3]
${botaoCobrarPix}    ${telaPix}/android.widget.Button[4]
${botaoMinhasChaves}    xpath=//android.view.View[@content-desc="Minhas chaves"]
${botaoMeuLimitePix}    xpath=//android.view.View[@content-desc="Meu limite Pix"]
${botaoMeAjuda}    xpath=//android.view.View[@content-desc="Me ajuda"]

*** Keywords ***

Então deve ser possível ver as informações sobre a funcionalidade de pix
    Wait Until Page Contains Element    ${telaPix}
    Page Should Contain Element    ${telaPix}
    ${texto}=    Get Element Content Desc    ${telaPix}
    Should Contain    ${texto}    Tudo o que você precisa para pagar, transferir ou cobrar.
    Should Contain    ${texto}    Pagar
    Should Contain    ${texto}    Transferir
    Should Contain    ${texto}    Cobrar
    Page Should Contain Element    ${botaoPagarPix}
    Page Should Contain Element    ${botaoTransferirPix}
    Page Should Contain Element    ${botaoCobrarPix}
    Page Should Contain Element    ${botaoMinhasChaves}
    Page Should Contain Element    ${botaoMeuLimitePix}
    Page Should Contain Element    ${botaoMeAjuda}