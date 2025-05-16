*** Settings ***
Resource    ../pages/home.robot
Suite Teardown    Fechar o Navegador

*** Test Cases ***

TC001 - Validar acessso à Relatórios
    Abrir o Navegador e Acessar o Sistema
    Realizar Login com Sucesso
    Acessar Relatórios

TC002 - Validar formato em tempo médio
    Abrir o Navegador e Acessar o Sistema
    Realizar Login com Sucesso
    Relatórios Tempo Médio