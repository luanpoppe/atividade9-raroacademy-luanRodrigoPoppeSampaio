*** Settings ***
Library    AppiumLibrary
Library    XML
Resource    ../base.robot
*** Variables ***
${telaRecargaCelular}    xpath=//android.widget.EditText
${botaoVoltarRecargaCelular}    xpath=//android.widget.Button


*** Keywords ***

Então usuário deve ver a instrução da recarga
    Wait Until Page Contains Element    ${telaRecargaCelular}
    O atributo do elemento deve conter texto    ${telaRecargaCelular}    hint    Qual número você quer recarregar?\n(DDD) + Número
    AppiumLibrary.Element Text Should Be    ${telaRecargaCelular}    ${EMPTY}

E deve ser possível digitar qual o número será carregado
    Input Text    ${telaRecargaCelular}    11978046445
    Wait Until Keyword Succeeds    4    1    Element Should Contain Text    ${telaRecargaCelular}    (11) 97804-6445

Quando tentar digitar um número de telefone contendo letras
    Wait Until Element Is Visible    ${telaRecargaCelular}
    Input Text    ${telaRecargaCelular}    1197804abcd

Então as letras digitadas não devem ser consideradas para a recarga
    Wait Until Keyword Succeeds    4    1    Element Should Contain Text    ${telaRecargaCelular}    (11) 97804-

Quando tentar digitar um número de telefone com mais de 11 números
    Wait Until Element Is Visible    ${telaRecargaCelular}
    Input Text    ${telaRecargaCelular}    119780464451234

Então o número considerado só deverá conter os primeiros 11 valores digitados
    Wait Until Keyword Succeeds    4    1    Element Should Contain Text    ${telaRecargaCelular}    (11) 97804-6445