*** Settings ***
Resource    ../pages/home.robot
Suite Teardown    Fechar o Navegador

*** Test Cases ***

TC001 - Validar acesso ao CRM
    Abrir o Navegador e Acessar o Sistema
    Realizar Login com Sucesso
    Acessar CRM

TC002 - Validar que não está com tela branca
    Abrir o Navegador e Acessar o Sistema
    Realizar Login com Sucesso
    Validar informações do contato no CRM