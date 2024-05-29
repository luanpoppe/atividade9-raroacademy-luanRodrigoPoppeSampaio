*** Settings ***
Library    AppiumLibrary
Library    XML
Resource    ../base.robot
*** Variables ***
${telaDepositar}    xpath=//android.view.View[@content-desc="Como você quer depositar na sua conta do Nubank"]
${botaoPixDepositar}    xpath=//android.view.View[@content-desc="Pix\nSem custo e cai na hora, mesmo de madrugada e fim de semana."]
${botaoBoletoDepositar}    xpath=//android.view.View[@content-desc="Boleto\nSem custo e pode levar 3 dias úteis para o dinheiro cair."]
${botaoTedDocDepositar}    xpath=//android.view.View[@content-desc="TED/DOC\nPode ter custo e cai somente em horário comercial de dias úteis."]
${botaoTrazerSeuSalario}    xpath=//android.view.View[@content-desc="Trazer seu salário\nReceba todo mês direto aqui na sua conta, sem custo."]
${botaoVoltarDepositos}    xpath=//android.widget.Button

*** Keywords ***

Então deve ser possível ver as informações sobre depósitos
    Wait Until Page Contains Element    ${telaDepositar}
    Checar se elementos estão habilitados e visíveis    ${botaoPixDepositar}    ${botaoBoletoDepositar}    ${botaoTedDocDepositar}    ${botaoTrazerSeuSalario}