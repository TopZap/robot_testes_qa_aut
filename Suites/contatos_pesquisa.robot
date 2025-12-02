*** Settings ***
Resource    ../resources/pages/keywords/kw.resource
Resource    ../resources/pages/variables/var.resource

Test Setup        Abrir o Navegador e Acessar o Sistema
Test Teardown     Fechar o Navegador

*** Test Cases ***

TC001 - Valida pesquisa por contatos
    [Documentation]    Testa para validar a pesquisa por contatos
...                    Contatos pesquisados: "teste pesquisa 1", "teste pesquisa 2" e "pesquisando contato"   
    [Tags]    menu    pesquisa_contatos
    Dado que esteja logado
    Quando acessar o menu contatos
    Então pesquisar contatos