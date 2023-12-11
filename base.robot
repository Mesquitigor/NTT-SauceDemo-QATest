*** Settings ***
Documentation       Esse arquivo serve de base para os outros arquivos referente à Prova Técnica NTT Data
Library             DateTime
Library             SeleniumLibrary
Library             OperatingSystem

Resource            ./steps.robot
Resource            ./tests.robot
Resource            ./variables.robot


*** Keywords ***
Conexão com Sauce Demo
    Open Browser  ${URL}  ${BROWSER}

Set Output Directory
    ${current_date}      Get Current Date    result_format=%Y%m%d_%H%M%S
    Set Global Variable  ${path}             ${OUTPUT_DIR}/${current_date}

Screen capture
    [Arguments]    ${nome_do_arquivo}
    ${screenshot}  Capture Page Screenshot
    Set Test Variable    ${screenshot}
    Copy File    ${screenshot}    results/${nome_do_arquivo}