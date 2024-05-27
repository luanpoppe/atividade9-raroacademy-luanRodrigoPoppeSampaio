*** Settings ***
Library    AppiumLibrary
Library    XML
Resource    ../base.robot
*** Variables ***
${telaCobranca}        xpath=//android.widget.EditText

*** Keywords ***

Então usuário deve ver a instrução da cobrança
    Wait Until Page Contains Element    ${telaCobranca}
    Page Should Contain Element    ${telaCobranca}
    ${hint}=    Get Element Attribute    ${telaCobranca}    hint
    Should Contain    ${hint}    Qual valor você quer receber?\nNão especificar um valor >
    Element Text Should Be    ${telaCobranca}    R$ 0,00

E deve ser possível digitar qual o número será cobrado
    Input Text    ${telaCobranca}    5560
    Wait Until Keyword Succeeds    4    1    Element Text Should Be    ${telaCobranca}    R$ 55,60

E usuário tenta digitar um valor de cobrança contendo letras
    Wait Until Page Contains Element    ${telaTransferir}
    Input Text    ${telaCobranca}    55abc60
Então as letras digitadas não devem ser consideradas para a cobrança
    Wait Until Keyword Succeeds    4    1    Element Text Should Be    ${telaCobranca}    R$ 55,60

E usuário tenta digitar um valor de cobrança com mais de 11 números
    Wait Until Page Contains Element    ${telaCobranca}
    Input Text    ${telaCobranca}    12345678901234
    Input Text    ${telaCobranca}    5678

Então o número considerado só irá conter os primeiros 14 valores digitados
    Wait Until Keyword Succeeds    4    1    Element Text Should Be    ${telaCobranca}    R$ 123.456.789.012,34