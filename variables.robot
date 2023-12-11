*** Settings ***
Documentation       Esse arquivo contém os variáveis para os testes referentes à Prova Técnica NTT Data
Resource            base.robot

*** Variables ***
${URL}                   https://www.saucedemo.com/
${BROWSER}               Firefox
${OUTPUT_DIR}            C:/Users/User/Documents/QA/desafio_python/results

${correct_user}          standard_user
${password}              secret_sauce
${name_item}             Sauce Labs Backpack
${name_item2}            Sauce Labs Bike Light
${name_item3}            Sauce Labs Onesie
${price_item}            $29.99
${price_item2}           $9.99
${price_item3}           $7.99
${id_clicked_element}    add-to-cart-sauce-labs-backpack
${id_clicked_element2}   add-to-cart-sauce-labs-bike-light
${id_clicked_element3}   add-to-cart-sauce-labs-onesie
${text_clicked_element}  carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.
${text_clicked_element2}  A red light isn't the desired state in testing but it sure helps when riding your bike at night. Water-resistant with 3 lighting modes, 1 AAA battery included.
${text_clicked_element3}  Rib snap infant onesie for the junior automation engineer in development. Reinforced 3-snap bottom closure, two-needle hemmed sleeved and bottom won't unravel.
${remove_button}         remove-sauce-labs-backpack