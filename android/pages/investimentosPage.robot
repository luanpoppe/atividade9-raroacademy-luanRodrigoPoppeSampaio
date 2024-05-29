*** Settings ***
Library    AppiumLibrary
Library    XML
Resource    ../base.robot
*** Variables ***
${telaInvestimentos}        xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View
${imagemTituloInvestimentos}    xpath=//android.widget.ImageView
${tituloInvestimentos}    xpath=//android.view.View[@content-desc="Invista sem taxas e burocracia!"]
${descricaoInvestimentos1}    xpath=//android.view.View[@content-desc="Estamos convidando alguns clientes do Nubank para serem os primeiros a fazer parte desta revolução roxa nos investimentos, e você é um deles!"]
${descricaoInvestimentos2}    xpath=//android.view.View[@content-desc="Além de não pagar nada para abrir a conta, você terá taxa zero na corretagem de ações!"]
${botaoAvançarInvestimentos}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.Button
${botaoVoltarInvestimentos}    xpath=//android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.Button

*** Keywords ***
Aguardar tela de investimentos carregar
    Wait Until Page Contains Element     ${telaInvestimentos}

Quando clicar na opção de retornar da seção de investimentos
    Aguardar para clicar no elemento    ${botaoVoltarInvestimentos}

Então deve ser possível ver as informações sobre investimentos
    Wait Until Page Contains Element    ${telaInvestimentos}
    Wait Until Page Contains Element    ${imagemTituloInvestimentos}
    Checar se elementos estão visíveis    ${imagemTituloInvestimentos}    ${tituloInvestimentos}    ${descricaoInvestimentos1}    ${descricaoInvestimentos2}    ${botaoAvançarInvestimentos}

Então o aplicativo deve retornar à sua página inicial onde se encontrava
    Set Test Variable    ${botaoInvestimentos}    xpath=//android.view.View[@content-desc="Investimentos\nA revolução roxa começou. Invista de maneira simples, sem burocracia e 100% digital."]
    Wait Until Keyword Succeeds    4    1    Checar se elementos estão visíveis    ${botaoInvestimentos}