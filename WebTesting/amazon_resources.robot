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
${TITULO}    Eletrônicos e Tecnologia | Amazon.com.br
${NOME_CATEGORIA}    Eletrônicos e Tecnologia
${PRODUTO}    Xbox Series S
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
Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[2]
Verificar o title da pagina de pesquisa do produto
    Title Should Be    title=Amazon.com.br : Xbox Series S

# Gherkin steps

# Caso de teste 01
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
 Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"
Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "${TITULO}"
E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
E a categoria "${NOME_CATEGORIA}" deve ser exibida na página
    Verificar se aparece a categoria "${NOME_CATEGORIA}"

# Caso de teste 02

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "${PRODUTO}" no campo de Pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
Então o título da página deve ficar "${TITLE_PESQUISA}"
    Title Should Be    title=${TITLE_PESQUISA}
E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"