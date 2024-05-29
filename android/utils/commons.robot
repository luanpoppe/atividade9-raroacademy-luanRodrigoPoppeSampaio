*** Settings ***

Resource    ../base.robot

*** Keywords ***

Aguardar para clicar no elemento
    [Arguments]    ${elemento}
    Wait Until Element Is Visible    ${elemento}
    Click Element    ${elemento}

Espera o elemento para fazer o inputtext
    [Arguments]    ${elemento}    ${texto}
    Wait Until Element Is Visible    ${elemento}
    Input Text                       ${elemento}    ${texto}

Swipe para esquerda X
    [Arguments]    ${valorXFinal}=20    ${valorY}=20    ${valorXInicial}=70
    Swipe By Percent    ${valorXInicial}    ${valorY}    ${valorXFinal}    ${valorY}

Swipe para cima Y
    [Arguments]    ${valorYFinal}=20    ${valorX}=20    ${valorYInicial}=75
    Swipe By Percent    ${valorX}    ${valorYInicial}    ${valorX}    ${valorYFinal}

Checar se elementos estão habilitados
    [Arguments]    @{elementos}
    FOR    ${elemento}    IN    @{elementos}
        ${attr}    AppiumLibrary.Get Element Attribute    ${elemento}    enabled
        Should Be Equal    ${attr}    true
    END

Checar se elementos estão visíveis
    [Arguments]    @{elementos}
    FOR    ${elemento}    IN    @{elementos}
        Element Should Be Visible    ${elemento}
    END

Checar se elementos estão habilitados e visíveis
    [Arguments]    @{elementos}
    Checar se elementos estão habilitados    @{elementos}
    Checar se elementos estão visíveis    @{elementos}

O atributo do elemento deve conter texto
    [Arguments]    ${elemento}    ${atributo}    ${texto}
    ${attr}=    AppiumLibrary.Get Element Attribute    ${elemento}    ${atributo}
    Should Contain    ${attr}    ${texto}