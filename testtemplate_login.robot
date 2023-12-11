*** Settings ***
Documentation       Esse arquivo contém validações para tela de login referente à Prova Técnica NTT Data
Resource            base.robot
Test Setup          Conexão com Sauce Demo
Test teardown       Close Browser
Test Template       Cenários de login com falha

*** Test Cases ***                          Login                     Password
Login com standard_user             standard_user             secret_sauce
Login com locked_out_user           locked_out_user           secret_sauce
Login com problem_user              problem_user              secret_sauce
Login com performance_glitch_user   performance_glitch_user   secret_sauce
Login com error_user                error_user                secret_sauce
Login com visual_user               visual_user               secret_sauce

*** Keywords ***
Cenários de login com falha
    [Arguments]    ${login}         ${password}
    Input Text     id=user-name     ${login}
    Input Text     id=password      ${password}

    ${comparacao1}       Evaluate          '${login}' == 'standard_user'
    ${comparacao2}       Evaluate          '${login}' == 'locked_out_user'
    ${comparacao3}       Evaluate          '${login}' == 'problem_user'
    ${comparacao4}       Evaluate          '${login}' == 'performance_glitch_user'
    ${comparacao5}       Evaluate          '${login}' == 'error_user'
    ${comparacao6}       Evaluate          '${login}' == 'visual_user'
    
    IF    ${comparacao1} == ${True}
        Click Element                  id=login-button
        Wait Until Page Contains       Products
        Page Should Contain            Products
        ${x_cart}      Get Horizontal Position    locator=//*[@id="shopping_cart_container"]/a
        ${y_cart}      Get Vertical Position      locator=//*[@id="shopping_cart_container"]/a
        Click Element  locator=//*[@id="shopping_cart_container"]/a
        ${x_checkout}  Get Horizontal Position    id=checkout
        ${y_checkout}  Get Vertical Position      id=checkout
        Set Suite Variable    ${x_cart}
        Set Suite Variable    ${y_cart}
        Set Suite Variable    ${x_checkout}
        Set Suite Variable    ${y_checkout}
        # Página ok!
    ELSE IF   ${comparacao2} == ${True}
        Click Element                  id=login-button
        Page Should Contain            Epic sadface: Sorry, this user has been locked out.
        # Erro no login com mensagem de erro
    ELSE IF   ${comparacao3} == ${True}
        Click Element                  id=login-button
        Click Element                  id=add-to-cart-sauce-labs-backpack
        Page Should Contain Element    id=remove-sauce-labs-backpack
        Click Element                  id=remove-sauce-labs-backpack
        Page Should Contain Element    id=add-to-cart-sauce-labs-backpack
        Click Element                  id=add-to-cart-sauce-labs-bolt-t-shirt 
        Page Should Contain Element    id=remove-sauce-labs-bolt-t-shirt 
        # Página não está responsiva
    ELSE IF   ${comparacao4} == ${True}
        ${now}       Get Time       format=yearmonthdayhourminsec
        ${now}       Evaluate       ${now}[0]${now}[1]${now}[2]${now}[3]${now}[4]${now}[5]
        Click Element               id=login-button
        Wait Until Page Contains    Products
        ${after}     Get Time       format=yearmonthdayhourminsec
        ${after}     Evaluate       ${after}[0]${after}[1]${after}[2]${after}[3]${after}[4]${after}[5]
        ${duration}  Evaluate       ${after} - ${now}
        Should Be True    ${duration} < 3
        # Página com delay acima de 3 segundos para carregar
    ELSE IF   ${comparacao5} == ${True}
        Click Element                  id=login-button
        Click Element                  id=add-to-cart-sauce-labs-backpack
        Page Should Contain Element    id=remove-sauce-labs-backpack
        Click Element                  id=add-to-cart-sauce-labs-bolt-t-shirt 
        Page Should Contain Element    id=remove-sauce-labs-bolt-t-shirt
        # Página com impossibilidade de adicionar alguns itens no carrinho
    ELSE IF   ${comparacao6} == ${True}
        Click Element  id=login-button
        ${xx}   Get Horizontal Position    locator=//*[@id="shopping_cart_container"]/a
        ${yy}   Get Vertical Position      locator=//*[@id="shopping_cart_container"]/a
        Should Be Equal As Integers    ${xx}    ${x_cart}
        Should Be Equal As Integers    ${yy}    ${y_cart}
        Click Element  locator=//*[@id="shopping_cart_container"]/a
        ${xxx}  Get Horizontal Position    id=checkout
        ${yyy}  Get Vertical Position      id=checkout
        Should Be Equal As Integers    ${xxx}    ${x_checkout}
        Should Be Equal As Integers    ${yyy}    ${y_checkout}
        # Página com elementos fora do lugar
    END