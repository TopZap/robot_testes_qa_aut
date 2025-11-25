*** Settings ***
Resource    ../resources/pages/keywords/kw.resource
Resource    ../resources/pages/variables/var.resource

Test Setup        Abrir o Navegador e Acessar o Sistema
Test Teardown     Fechar o Navegador

*** Test Cases ***

TC001 - Valida a pesquisa de empresa através do cnpj
    [Documentation]    Acessar o menu lateral "Empresas", inserir o país e número do CNPJ
    ...                Valida os dados da emrpesa
    [Tags]    adicionar_empresa    cnpj 
    Dado que esteja logado Admin
    Quando acessar o menu planos
    E acessar o menu empresas
    Quando adicionar empresas
    Então inserir dados da empresa