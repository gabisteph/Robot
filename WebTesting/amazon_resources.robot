*** Settings ***

Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br/
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]
${TEXTO_HEADER_ELETRONICOS}    Eletrônicos e Tecnologia
${HOME}    //a[contains(@class,'nav-logo-link nav-progressive-attribute')]
${BUSCA}    //input[contains(@type,'text')]
${BOTAO_PESQUISA}    //input[contains(@type,'submit')]
*** Keywords ***

Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser
Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}
Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}
Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains    text=${TEXTO_HEADER_ELETRONICOS}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}
Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}
Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//a[@aria-label='${NOME_CATEGORIA}']
Digitar o nome de produto "${PRODUTO}" no campo de Pesquisa
    Input Text    locator=twotabsearchtextbox   text=${PRODUTO}
Clicar no botão de pesquisa
    Click Button    locator=${BOTAO_PESQUISA}