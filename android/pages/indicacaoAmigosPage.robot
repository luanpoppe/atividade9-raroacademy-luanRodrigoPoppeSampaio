*** Settings ***
Library    AppiumLibrary
Resource    ../base.robot
*** Variables ***
${telaIndicarAmigos}        xpath=//android.widget.ImageView[@content-desc="Resgate seus amigos da fila do banco\nPara cada indicação aceita, um amigo salvo da burocracia"]
${botaoIndicarAmigos}    xpath=//android.widget.Button[@content-desc="INDICAR AMIGOS"]



*** Keywords ***

Então devo ver as informações sobre a funcionalidade de indicação e amigos
    Wait Until Page Contains Element    ${botaoIndicarAmigos}
    Page Should Contain Element    ${telaIndicarAmigos}
    Element Should Be Visible    ${botaoIndicarAmigos}