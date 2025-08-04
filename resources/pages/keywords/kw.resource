*** Settings ***

Library    SeleniumLibrary
Library    XML
Resource   ../variables/var.resource

*** Keywords ***
Abrir o Navegador e Acessar o Sistema
    Open Browser    ${home.url}    chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    3s

Fechar o Navegador
    Close Browser

Dado que esteja logado
    Wait Until Element Is Enabled    ${home.username_field}    60
    Input Text                       ${home.username_field}    ${home.username}
    Input Text                       ${home.password_field}    ${home.password}
    Click Button                     ${home.login_button}
    Wait Until Element Is Enabled    ${home.success_msg}    60
    ${current_url}=    Get Location
    Should Contain                   ${current_url}    dashboard

Dado que esteja logado Admin
    Wait Until Element Is Enabled    ${home.username_field}    60
    Input Text                       ${home.username_field}    ${home.user_name_admin}
    Input Text                       ${home.password_field}    ${home.pass_adm}
    Click Button                     ${home.login_button}

Quando estiver logado com usuário teste
    Wait Until Element Is Enabled    ${home.username_field}    60
    Input Text                       ${home.username_field}    test@test.com
    Input Text                       ${home.password_field}    123456
    Sleep    2
    Double Click Element             ${home.login_button}

Então ralizo Login com usuário não cadastrado
    Wait Until Element Is Enabled    ${home.username_field}    60
    Input Text                       ${home.username_field}    ${home.username_nao_cadastrado}
    Input Text                       ${home.password_field}    ${home.password}
    Click Button                     ${home.login_button}
    Wait Until Element Is Enabled    ${home.error_login}    60
    Set Focus To Element             ${home.error_login}
    ${Erro_Login}    Get Text    ${home.error_login}
    Log To Console    Validar mensagem de erro: ${Erro_Login}
    # Capture Page Screenshot

 Então realizo login com senha inválida
    Wait Until Element Is Enabled    ${home.username_field}    60
    Input Text                       ${home.username_field}    ${home.username}
    Input Text                       ${home.password_field}    ${home.password_invalido}
    Click Button                     ${home.login_button}
    Wait Until Element Is Enabled    ${home.error_login}    60
    Set Focus To Element             ${home.error_login}
    ${Erro_Login}    Get Text    ${home.error_login}
    Log To Console    Validar mensagem de erro: ${Erro_Login}
    # Capture Page Screenshot

Então realizo Logout com Sucesso
    Scroll Element Into View         ${home.logout}
    Wait Until Element Is Visible    ${home.logout}    60
    Click Button                     ${home.logout}
    Wait Until Location Is           ${home.expected_url}    60
    ${current_url}=    Get Location
    Should Be Equal As Strings       ${current_url}    ${home.expected_url}
    # Capture Page Screenshot

Então validar usuário em atendimento
    Wait Until Element Is Visible    ${home.service_button}    60
    Set Focus To Element             ${home.service_button}
    Click Button                     ${home.service_button}

    Wait Until Element Is Visible    ${home.service_select}    60
    Set Focus To Element             ${home.service_select}    
    Click Button                     ${home.service_select}

    # É necessário ter um usuário presente
    Wait Until Element Is Visible    ${home.img_contact}    60
    Set Focus To Element             ${home.img_contact}
    Click Image                      ${home.img_contact}
    # Capture Page Screenshot

Então filtrar por filas  
    Wait Until Element Is Visible    ${home.atendimento_button}    60
    Set Focus To Element             ${home.atendimento_button}
    Click Button                     ${home.atendimento_button}
    # Não funciona sem o sleep
    Sleep    2
    Wait Until Element Is Visible    ${home.all_button}    60
    Set Focus To Element             ${home.all_button}
    Click Element                    ${home.all_button}
    
    Sleep    2
    Wait Until Element Is Visible    ${home.filas_button}    60
    Set Focus To Element             ${home.filas_button}
    Click Element                    ${home.filas_button}
    # Deverá apresentar apenas uma caixa de "Filas"
    Sleep    2
    Wait Until Element Is Visible    ${home.filas_label}    60
    Set Focus To Element             ${home.filas_label}
    Element Should Be Visible        ${home.filas_label}
    # Capture Page Screenshot

Então validar informações do contato no CRM
    Reload Page
    Sleep    2
    Wait Until Element Is Visible    ${home.crm}    60
    Set Focus To Element             ${home.crm}
    Click Element                    ${home.crm}
    
    Wait Until Element Is Visible    ${home.funil_crm}    60
    Set Focus To Element             ${home.funil_crm}
    Click Element                    ${home.funil_crm}
    # É necessário ter um usuário presente
    Wait Until Element Is Visible    ${home.img_contato_crm}    60
    Set Focus To Element             ${home.img_contato_crm}
    Click Element                    ${home.img_contato_crm}
    # Validar o campo "Atividades", validando que não está com tela branca
    Wait Until Element Is Visible    ${home.atividades_crm}    60
    Set Focus To Element             ${home.atividades_crm}
    Element Should Be Visible        ${home.atividades_crm}
     # Validar o campo "Informações", validando que não está com tela branca
    Wait Until Element Is Visible    ${home.imformacoes_gerais_crm}    60
    Set Focus To Element             ${home.imformacoes_gerais_crm}
    Element Should Be Visible        ${home.imformacoes_gerais_crm}
    # Capture Page Screenshot

Então acessar Relatórios Tempo Médio
    # Acessar o menu "Relatótios"
    Wait Until Element Is Visible    ${home.menu_relatorios}    60
    Set Focus To Element             ${home.menu_relatorios}
    Click Element                    ${home.menu_relatorios}
    
    # Acessar o módulo "Tempo Médio"
    Wait Until Element Is Visible    ${home.modulo_tempo_medio}    60
    Set Focus To Element             ${home.modulo_tempo_medio}
    Click Element                    ${home.modulo_tempo_medio}

    # Validar a coluna "Tempo Médio de Espera por Atendimento"
    Wait Until Element Is Visible    ${home.coluna_tempo_espera_atendimento}    60
    Set Focus To Element             ${home.coluna_tempo_espera_atendimento} 
    
    # Validar com Screenshot que o formato do tempo está correto
    Wait Until Element Is Visible    ${home.tempo_medio_horas}    60
    Set Focus To Element             ${home.tempo_medio_horas}
    # Capture Page Screenshot

Edição de mensagens em atendimentos
    # Deverá ter uma mensagem com o texto "Testar edição"
    Wait Until Element Is Visible    ${home.testar_edição}    60
    Set Focus To Element             ${home.testar_edição}
    Click Element                    ${home.testar_edição}

    Wait Until Element Is Visible    ${home.menu_editar_msgs}    60
    Set Focus To Element             ${home.menu_editar_msgs}
    Click Element                    ${home.menu_editar_msgs}

    Wait Until Element Is Visible    ${home.editar_mensagens}    60
    Set Focus To Element             ${home.editar_mensagens}
    Click Element                    ${home.editar_mensagens}

    Wait Until Element Is Visible    ${home.inserir_msg_edição}    60
    Set Focus To Element             ${home.inserir_msg_edição}
    Clear Element Text               ${home.inserir_msg_edição}

    Input Text                       ${home.inserir_msg_edição}    Mensagem Editada    

Quando acessar o menu Dashboard
    # Validar acesso ao Dashboard
    Wait Until Element Is Visible    ${home.dashboard}    60
    Set Focus To Element             ${home.dashboard}
    Click Element                    ${home.dashboard}

    Wait Until Element Is Enabled    ${home.success_msg}    60
    ${current_url}=    Get Location
    Should Contain                   ${current_url}    dashboard 

E acessar o menu atendimentos
    # Validar acesso ao Atendimentos
    Wait Until Element Is Visible    ${home.atendimento_button}    60
    Set Focus To Element             ${home.atendimento_button}
    Click Element                    ${home.atendimento_button}
    ${current_url}=    Get Location
    Should Contain                   ${current_url}    tickets

 Quando acessar o menu atendimento simples
    # Validar acesso à Atendimento Simples
    Wait Until Element Is Visible    ${home.atendimento_simples}    60
    Set Focus To Element             ${home.atendimento_simples}
    Click Element                    ${home.atendimento_simples}
    ${current_url}=    Get Location
    Should Contain                   ${current_url}    simple-tickets

Quando acessar o menu contatos
    # Validar acesso à Contatos
    Wait Until Element Is Visible    ${home.contatos_menu}    60
    Set Focus To Element             ${home.contatos_menu}
    Click Element                    ${home.contatos_menu}
    ${current_url}=    Get Location
    Should Contain                   ${current_url}    contacts
    
    Wait Until Element Is Visible    ${home.contatos_page}    60
    Set Focus To Element             ${home.contatos_page}
    Element Should Be Visible        ${home.contatos_page}

Quando acessar o menu campanhas
    # Validar acesso à Campanhas
    Wait Until Element Is Visible    ${home.menu_campanhas}    60
    Set Focus To Element             ${home.menu_campanhas}
    Click Element                    ${home.menu_campanhas}
    ${current_url}=    Get Location
    Should Contain                   ${current_url}    schedule

    Wait Until Element Is Visible    ${home.page_campanhas}    60
    Set Focus To Element             ${home.page_campanhas}
    Element Should Be Visible        ${home.page_campanhas}

Quando acessar o menu relatórios
    # Validar acesso à Relatórios
    Wait Until Element Is Visible    ${home.menu_relatorios}    60
    Set Focus To Element             ${home.menu_relatorios}
    Click Element                    ${home.menu_relatorios}
    ${current_url}=    Get Location
    Should Contain                   ${current_url}    reports

    Wait Until Element Is Visible    ${home.page_relatorios}    60
    Set Focus To Element             ${home.page_relatorios}
    Element Should Be Visible        ${home.page_relatorios}
    
Quando acessar o menu Google Agenda
    # Validar acesso à Google Agenda
    Scroll Element Into View         ${home.menu_google_agenda}
    Wait Until Element Is Visible    ${home.menu_google_agenda}    60
    Set Focus To Element             ${home.menu_google_agenda}
    Click Element                    ${home.menu_google_agenda}
    ${current_url}=    Get Location
    Should Contain                   ${current_url}    google_agenda

    Wait Until Element Is Visible    ${home.page_google_agenda}    60
    Set Focus To Element             ${home.page_google_agenda}
    Element Should Be Visible        ${home.page_google_agenda}

Quando acessar o menu chat shop
    # Validar acesso à Chat Shop
    Scroll Element Into View         ${home.menu_chat_shop}
    Wait Until Element Is Visible    ${home.menu_chat_shop}    60
    Set Focus To Element             ${home.menu_chat_shop}
    Click Element                    ${home.menu_chat_shop}
    ${current_url}=    Get Location
    Should Contain                   ${current_url}    shop_pedidos

    Wait Until Element Is Visible    ${home.page_chat_shop}    60
    Set Focus To Element             ${home.page_chat_shop}
    Element Should Be Visible        ${home.page_chat_shop}

Quando acessar o menu pedidos
    # Validar acesso à Pedidos
    Scroll Element Into View         ${home.menu_pedidos}
    Wait Until Element Is Visible    ${home.menu_pedidos}    60
    Set Focus To Element             ${home.menu_pedidos}
    Click Element                    ${home.menu_pedidos}
    ${current_url}=    Get Location
    Should Contain                   ${current_url}    chat_shop_ordered

    Wait Until Element Is Visible    ${home.page_pedidos}    60
    Set Focus To Element             ${home.page_pedidos}
    Element Should Be Visible        ${home.page_pedidos}

Quando acessar o menu administração
    # Validar acesso à Administração
    Reload Page
    Sleep    3
    Scroll Element Into View         ${home.menu_administração}
    Wait Until Element Is Visible    ${home.menu_administração}    60
    Set Focus To Element             ${home.menu_administração}
    Click Element                    ${home.menu_administração}
    ${current_url}=    Get Location
    Should Contain                   ${current_url}    administration

    Wait Until Element Is Visible    ${home.page_administração}    60
    Set Focus To Element             ${home.page_administração}
    Element Should Be Visible        ${home.page_administração}

Quando acessar o menu configuracões
    # Validar acesso à Configurações
    Scroll Element Into View         ${home.menu_configuração}
    Wait Until Element Is Visible    ${home.menu_configuração}    60
    Set Focus To Element             ${home.menu_configuração}
    Click Element                    ${home.menu_configuração}  

    Wait Until Element Is Visible    ${home.page_configurações}    60
    Set Focus To Element             ${home.page_configurações}
    Element Should Be Visible        ${home.page_configurações}

E acessar a aba contexto do menu configurações
    Wait Until Element Is Visible    ${home.contexto_config}    60
    Set Focus To Element             ${home.contexto_config}
    Click Element                    ${home.contexto_config}  

Então lançar contexto Personalizado
    # Clicar em Personalizado
    Wait Until Element Is Visible    ${home.personalisado_contexto}    60
    Set Focus To Element             ${home.personalisado_contexto}
    Click Element                    ${home.personalisado_contexto} 

    # Clicar em Adicionar Contexto
    Wait Until Element Is Visible    ${home.add_contexto}    60
    Set Focus To Element             ${home.add_contexto}
    Click Element                    ${home.add_contexto}
    
    # Inserir o nome
    Wait Until Element Is Visible    ${home.input_nome_contexto}    60
    Set Focus To Element             ${home.input_nome_contexto}
    Input Text                       ${home.input_nome_contexto}    teste_qa_teste
    
    Sleep    2
    ${contexto_personalizado}     Get Value    ${home.input_nome_contexto}
    Set Global Variable    ${contexto_personalizado}    ${contexto_personalizado}
    Log To Console    Nome inserido: ${contexto_personalizado}     

    # Selecionar o tipo "Contato"
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'react-select__control')]    60
    Set Focus To Element             xpath=//div[contains(@class, 'react-select__control')]
    Click Element                    xpath=//div[contains(@class, 'react-select__control')]

    Sleep    2
    Execute JavaScript    document.evaluate("//div[contains(@class, 'react-select__option') and text()='Contato']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
     
    # Salvar contexto personalizado
    Sleep    2
    Wait Until Element Is Visible    ${home.btn_salvar_contexto}    60
    Set Focus To Element             ${home.btn_salvar_contexto}
    Click Element                    ${home.btn_salvar_contexto}
    
    Sleep    2
    # Comparar variáveis e validar nome criado
     ${contexto_personalizado_criado}     Get Text  ${home.variavel_nome_contexto_person}
    Set Global Variable    ${contexto_personalizado_criado}    ${contexto_personalizado_criado}
    Log To Console    Nome criado: ${contexto_personalizado_criado} 
    
    Should Be Equal    ${contexto_personalizado}    ${contexto_personalizado_criado}    
    # Capture Page Screenshot

    # Clicar no botão excluir
    Wait Until Element Is Visible    ${home.btn_excluir_contexto_person}    60
    Set Focus To Element             ${home.btn_excluir_contexto_person}
    Sleep    2
    Click Element                    ${home.btn_excluir_contexto_person}
    Sleep    2

E acesso IA histórico de pagamento
    # Validar acesso ao menu Inteligência Artificial
    Wait Until Element Is Visible    ${home.ia_menu}    60
    Set Focus To Element             ${home.ia_menu}
    Click Element                    ${home.ia_menu} 
    
    Wait Until Element Is Visible    ${home.ia_menu}    60
    Set Focus To Element             ${home.ia_menu}
    Element Should Be Visible        ${home.ia_menu} 

    # Acessar o módulo histórico de pagamentos
    Wait Until Element Is Visible    ${home.ia_historico_pg}    60
    Set Focus To Element             ${home.ia_historico_pg}
    Click Element                    ${home.ia_historico_pg} 
    
    # Retorna a url atual do navegador
    ${url_atual}=    Get Location
    Should Be Equal As Strings    ${url_atual}    https://qa.greenchat.com.br/administration/ia?graph=day&menu=payments

E acesso IA histórico de uso
        # Validar acesso ao menu Inteligência Artificial
    Wait Until Element Is Visible    ${home.ia_menu}    60
    Set Focus To Element             ${home.ia_menu}
    Click Element                    ${home.ia_menu} 
    
    Wait Until Element Is Visible    ${home.ia_menu}    60
    Set Focus To Element             ${home.ia_menu}
    Element Should Be Visible        ${home.ia_menu} 

    # Acessar o módulo histórico de uso
    Wait Until Element Is Visible    ${home.ia_historico_uso}    60
    Set Focus To Element             ${home.ia_historico_uso}
    Click Element                    ${home.ia_historico_uso} 
    
    # Retorna a url atual do navegador
    ${url_atual}=    Get Location
    Should Be Equal As Strings    ${url_atual}    https://qa.greenchat.com.br/administration/ia?graph=day&menu=usages

E acesso IA relatorios de erros
    # Validar acesso ao menu Inteligência Artificial
    Wait Until Element Is Visible    ${home.ia_menu}    60
    Set Focus To Element             ${home.ia_menu}
    Click Element                    ${home.ia_menu} 
    
    Wait Until Element Is Visible    ${home.ia_menu}    60
    Set Focus To Element             ${home.ia_menu}
    Element Should Be Visible        ${home.ia_menu} 

    # Acessar o módulo relatórios de errros
    Wait Until Element Is Visible    ${home.ia_relatorios_erros}    60
    Set Focus To Element             ${home.ia_relatorios_erros}
    Click Element                    ${home.ia_relatorios_erros} 
    
    # Retorna a url atual do navegador
    ${url_atual}=    Get Location
    Should Be Equal As Strings    ${url_atual}    https://qa.greenchat.com.br/administration/ia?graph=day&menu=errors
    
E acesso IA configurações
    # Validar acesso ao menu Inteligência Artificial
    Wait Until Element Is Visible    ${home.ia_menu}    60
    Set Focus To Element             ${home.ia_menu}
    Click Element                    ${home.ia_menu} 
    
    Wait Until Element Is Visible    ${home.ia_menu}    60
    Set Focus To Element             ${home.ia_menu}
    Element Should Be Visible        ${home.ia_menu} 

    # Acessar o módulo configurações
    Wait Until Element Is Visible    ${home.ia_configuracoes}    60
    Set Focus To Element             ${home.ia_configuracoes}
    Click Element                    ${home.ia_configuracoes} 
    
    # Retorna a url atual do navegador
    ${url_atual}=    Get Location
    Should Be Equal As Strings    ${url_atual}    https://qa.greenchat.com.br/administration/ia?graph=day&menu=configs 
    
E acessar o módulo grupo de permissões
    # Acessar o módulo Grupo de Permissões
    Wait Until Element Is Visible    ${home.grupo_permissoes}    60
    Set Focus To Element             ${home.grupo_permissoes}
    Click Element                    ${home.grupo_permissoes} 
    
    # Validar o usuário "teste douglas qa"
    Wait Until Element Is Visible    ${home.grupo_teste_douglas_qa}    60
    Set Focus To Element             ${home.grupo_teste_douglas_qa}
    Log To Console    → Elemento visível com sucesso!

Então selecionar o modal contatos
    # Clicar em páginas e selecionar o modal "Contatos"
    Wait Until Element Is Visible    ${home.paginas_permissoes}    60
    Set Focus To Element             ${home.paginas_permissoes}
    Click Element                    ${home.paginas_permissoes} 
    
    # Clica caso o modal não esteja selecionado 
    Wait Until Element Is Visible    ${home.modal_contatos}    60
    Set Focus To Element             ${home.modal_contatos}
    Double Click Element             ${home.modal_contatos}  

    # Clicar em salvar
    Wait Until Element Is Visible    ${home.btn_salvar_permissoes}    60
    Set Focus To Element             ${home.btn_salvar_permissoes}
    Click Element                    ${home.btn_salvar_permissoes}

Então visualizar apenas o modal contatos 
    # Validar que há apenas o menu "Contatos"
    Wait Until Element Is Visible    ${home.contatos_menu}    60
    Set Focus To Element             ${home.contatos_menu}
    Element Should Be Visible        ${home.contatos_menu} 
    
    # Validar que há apenas o modal "Contatos"
    # Capture Page Screenshot

E validar carrossel
    # Validar que há o carrossel de informações
    Wait Until Element Is Visible    ${home.btn_carrossel_1}    60
    Set Focus To Element             ${home.btn_carrossel_1}
    Element Should Be Visible        ${home.btn_carrossel_1} 
    
    Wait Until Element Is Visible    ${home.btn_carrossel_2}    60
    Set Focus To Element             ${home.btn_carrossel_2}
    Element Should Be Visible        ${home.btn_carrossel_2}   

Quando acessar o menu planos
    # Validar o acesso ao menu plano
    Sleep    2
    Wait Until Element Is Visible    ${home.menu_planos_admin}    60
    Set Focus To Element             ${home.menu_planos_admin}
    Click Element                    ${home.menu_planos_admin}

E clicar em adicionar plano
    # validar o acesso ao botão adicionar plano
    Sleep    2
    Wait Until Element Is Visible    ${home.btn_add_plano}    60
    Set Focus To Element             ${home.btn_add_plano}
    Click Element                    ${home.btn_add_plano}

Então criar e validar plano por IA 
    # Acessar Configuração do Plano
    Wait Until Element Is Visible    ${home.btn_config_plano_ia}    60
    Set Focus To Element             ${home.btn_config_plano_ia}
    Click Element                    ${home.btn_config_plano_ia}
    
    # Inserir dados | Nome do plano
    Wait Until Element Is Visible    ${home.imput_plano_ia}    60
    Set Focus To Element             ${home.imput_plano_ia}
    Input Text                       ${home.imput_plano_ia}    Plano IA Automatizado

    # Guardar o plano criado em variável para validação final
    ${plano_IA_criado_aut}    Get Value   ${home.imput_plano_ia}
    Log To Console    Plano IA criado: ${plano_IA_criado_aut}  
    
    # Selecionar moeda do plano IA
    Wait Until Element Is Visible    ${home.select_moeda_ia}    60
    Set Focus To Element             ${home.select_moeda_ia}
    Click Element                    ${home.select_moeda_ia}    

    Wait Until Element Is Visible    ${home.real_brasileiro_moeda_ia}    60
    Click Element                    ${home.real_brasileiro_moeda_ia}

    # Inserir preço do plano
    Wait Until Element Is Visible    ${home.preco_plano_ia}    60
    Set Focus To Element             ${home.preco_plano_ia}
    Input Text                       ${home.preco_plano_ia}    1000

    # Inserir dias de testes
    Wait Until Element Is Visible    ${home.dias_testes_ia}    60
    Set Focus To Element             ${home.dias_testes_ia}
    Input Text                       ${home.dias_testes_ia}    1

    # Inserir quantidade de usuários
    Wait Until Element Is Visible    ${home.qt_usuarios_ia}    60
    Set Focus To Element             ${home.qt_usuarios_ia}
    Input Text                       ${home.qt_usuarios_ia}    1
    
    # Inserir tipo de pagamento
    Wait Until Element Is Visible    ${home.qt_conexoes_ia}    60
    Set Focus To Element             ${home.qt_conexoes_ia}
    Input Text                       ${home.qt_conexoes_ia}    1

    # Inserir quantidade de conexões
    Wait Until Element Is Visible    ${home.tipo_pagamento_ia}    60
    Set Focus To Element             ${home.tipo_pagamento_ia}
    Click Element                    ${home.tipo_pagamento_ia}

    Wait Until Element Is Visible    ${home.select_cartao_credito_ia}    60
    Click Element                    ${home.select_cartao_credito_ia}

    # Clicar em "Módulo do Plano" e selecionar IA
    Wait Until Element Is Visible    ${home.btn_modulo_plano}    60
    Set Focus To Element             ${home.btn_modulo_plano}
    Click Element                    ${home.btn_modulo_plano}

    Wait Until Element Is Visible    ${home.select_ia_modulos}    60
    Set Focus To Element             ${home.select_ia_modulos}
    Click Element                    ${home.select_ia_modulos} 

    # Inserir quantidade de tokens
    Wait Until Element Is Visible    ${home.qt_tokens_modulo_ia}    60
    Set Focus To Element             ${home.qt_tokens_modulo_ia}
    Input Text                       ${home.qt_tokens_modulo_ia}    10000    

    # Salvar plano crido por IA
    Wait Until Element Is Visible    ${home.btn_salvar_ia}    60
    Scroll Element Into View         ${home.btn_salvar_ia}
    Set Focus To Element             ${home.btn_salvar_ia}
    Click Element                    ${home.btn_salvar_ia}
    
    # Validar plano IA criado, comparando variáveis
    Sleep    3
    Wait Until Element Is Visible    ${home.variavel_plano_ia_automatizado}    60
    Set Focus To Element             ${home.variavel_plano_ia_automatizado}
    ${validar_plano_criado}    Get Text   ${home.variavel_plano_ia_automatizado}
    Log To Console    Plano IA criado: ${validar_plano_criado}
    Should Be Equal    ${validar_plano_criado}    Plano IA Automatizado

    # Excluir plano
    Wait Until Element Is Visible    ${home.excluir_plano}    60
    Scroll Element Into View         ${home.excluir_plano}
    Set Focus To Element             ${home.excluir_plano}
    Click Element                    ${home.excluir_plano}

    Wait Until Element Is Visible    ${home.btn_confirmar}    60
    Set Focus To Element             ${home.btn_confirmar}
    Click Element                    ${home.btn_confirmar}
    
    # Validar plano deletado
    Sleep    2
    Wait Until Element Is Visible    ${home.plano_deletado}    60
    Set Focus To Element             ${home.plano_deletado}
    Element Should Be Visible        ${home.plano_deletado}