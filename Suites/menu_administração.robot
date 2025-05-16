*** Settings ***
Resource    ../pages/home.robot
Suite Teardown    Fechar o Navegador

*** Test Cases ***

TC001 - Validar acesso à Administração
    Abrir o Navegador e Acessar o Sistema
    Realizar Login com Sucesso
    Acessar Administração