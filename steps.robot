*** Settings ***
Documentation       Esse arquivo contém os cenários de teste referente à Prova Técnica NTT Data
Resource            base.robot


*** Keywords ***
############################## DADO ##############################
Dado que eu faça o login na plataforma Sauce Demo
    Input Text                    id:user-name    ${correct_user}
    Input Password                id:password     ${password}
    Click Button                  name:login-button

############################## QUANDO ##############################
Quando eu adicionar um produto no carrinho
    Wait Until Page Contains      text=Products
    Click Button                  ${id_clicked_element}
    Element Should Be Visible     class:shopping_cart_badge

Quando eu adicionar alguns produtos no carrinho
    Wait Until Page Contains      text=Products
    Click Button                  ${id_clicked_element}
    Click Button                  ${id_clicked_element2}
    Click Button                  ${id_clicked_element3}
    Element Should Be Visible     class:shopping_cart_badge
    
############################## E ##############################
E eu entrar na página do carrinho
    Click Element                 id:shopping_cart_container

E eu entrar na página de checkout
    Click Element                 id:checkout
E inserir as credenciais do comprador
    Input Text       id:first-name   Test_FirstName
    Input Text       id:last-name    Test_LastName
    Input Text       id:postal-code  Test_PostalCode
    Click Element    id:continue
E concluir a compra
    Click Element    id:finish
E fazer o logout da plataforma
    Click Element    id:react-burger-menu-btn
    Wait Until Element Is Visible    id:logout_sidebar_link
    Click Element    id:logout_sidebar_link
############################## ENTÃO ##############################
Então devo ter todos os valores corretamente
    Wait Until Page Contains      text=Your Cart
    Page Should Contain           text=${text_clicked_element}
    Page Should Contain           text=${name_item}
    Page Should Contain           text=${price_item}
    Page Should Contain Element   id:remove-sauce-labs-backpack
    ${current_date}               Get Current Date    result_format=%Y%m%d_%H%M%S
    Screen capture                TC1-carrinho_${current_date}.png

Então devo confirmar as informações da compra
    Wait Until Page Contains      text=Checkout: Overview
    Page Should Contain           text=${text_clicked_element}
    Page Should Contain           text=${text_clicked_element2}
    Page Should Contain           text=${text_clicked_element3}
    Page Should Contain           text=${name_item}
    Page Should Contain           text=${name_item2}
    Page Should Contain           text=${name_item3}
    Page Should Contain           text=${price_item}
    Page Should Contain Element   id:cancel
    Page Should Contain Element   id:finish
    Page Should Contain           $51.81
    ${current_date}               Get Current Date    result_format=%Y%m%d_%H%M%S
    Execute JavaScript            window.scrollTo(0, document.body.scrollHeight);
    Screen capture                TC2-valortotal_${current_date}.png