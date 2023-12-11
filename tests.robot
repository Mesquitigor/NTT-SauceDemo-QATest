*** Settings ***
Documentation       Esse arquivo contém os cenários de teste referente à Prova Técnica NTT Data
Resource            base.robot
Suite Setup         Set Output Directory
Test Setup          Conexão com Sauce Demo
Test teardown       Close Browser

*** Test Cases ***
TC-01 - Validar os valores no carrinho de um produto qualquer
    Dado que eu faça o login na plataforma Sauce Demo
    Quando eu adicionar um produto no carrinho
    E eu entrar na página do carrinho
    Então devo ter todos os valores corretamente

TC-02 - Validar valor total de uma compra
    Dado que eu faça o login na plataforma Sauce Demo
    Quando eu adicionar alguns produtos no carrinho
    E eu entrar na página do carrinho
    E eu entrar na página de checkout
    E inserir as credenciais do comprador
    Então devo confirmar as informações da compra
    E concluir a compra
    E fazer o logout da plataforma
