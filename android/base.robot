*** Settings ***

Library    AppiumLibrary

Resource    utils/config.robot
Resource    utils/commons.robot

# Pages
Resource    pages/paginaInicialPage.robot
Resource    pages/indicacaoAmigosPage.robot
Resource    pages/pixPage.robot
Resource    pages/pagarPage.robot
Resource    pages/transferirPage.robot
Resource    pages/depositarPage.robot

# Features:
# Resource    features/paginaInicial.robot