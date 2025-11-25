*** Settings ***

Library    SeleniumLibrary
Library    String
Resource   ../variables/var.resource

*** Keywords ***
Abrir o Navegador e Acessar o Sistema
    Open Browser    ${home.url}    chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    3s

Fechar o Navegador
    Close Browser

Dado que esteja logado
    # Inserir usuário
    Wait Until Element Is Enabled    ${home.username_field}    120
    Scroll Element Into View         ${home.username_field}
    Set Focus To Element             ${home.username_field}
    Input Text                       ${home.username_field}    ${home.username}
    # Inserir senha
    Wait Until Element Is Enabled    ${home.password_field}    120
    Scroll Element Into View         ${home.password_field}
    Set Focus To Element             ${home.password_field}
    Input Text                       ${home.password_field}    ${home.password}
    # Clicar em login
    Wait Until Element Is Enabled    ${home.login_button}    120
    Scroll Element Into View         ${home.login_button}
    Set Focus To Element             ${home.login_button}
    Click Element                    ${home.login_button}

Dado que esteja logado Admin
    # Inserir usuário
    Wait Until Element Is Enabled    ${home.username_field}    120
    Scroll Element Into View         ${home.username_field}
    Set Focus To Element             ${home.username_field}
    Input Text                       ${home.username_field}    ${home.user_name_admin}
    # Inserir senha
    Wait Until Element Is Enabled    ${home.password_field}    120
    Scroll Element Into View         ${home.password_field}
    Set Focus To Element             ${home.password_field}
    Input Text                       ${home.password_field}    ${home.pass_adm}
    # Clicar em login
    Wait Until Element Is Enabled    ${home.login_button}    120
    Scroll Element Into View         ${home.login_button}
    Set Focus To Element             ${home.login_button}
    Click Button                     ${home.login_button}

Quando estiver logado com usuário teste
    # Inserir usuário
    Wait Until Element Is Enabled    ${home.username_field}    60
    Input Text                       ${home.username_field}    test@test.com
    Input Text                       ${home.password_field}    123456
    Sleep    2
    Double Click Element             ${home.login_button}

Então ralizo Login com usuário não cadastrado
    # Inserir usuário não cadastrado
    Wait Until Element Is Enabled    ${home.username_field}    60        
    Input Text                       ${home.username_field}    ${home.username_nao_cadastrado}
    # Inserir senha
    Input Text                       ${home.password_field}    ${home.password}    
    Click Button                     ${home.login_button}
    # Validar mensagem de erro
    Wait Until Element Is Enabled    ${home.error_login}    60
    Set Focus To Element             ${home.error_login}
    ${Erro_Login}    Get Text    ${home.error_login}
    Log To Console    Validar mensagem de erro: ${Erro_Login}

 Então realizo login com senha inválida
    # Inserir usuário
    Wait Until Element Is Enabled    ${home.username_field}    60
    Input Text                       ${home.username_field}    ${home.username}
    # Inserir senha inválida
    Input Text                       ${home.password_field}    ${home.password_invalido}
    Click Button                     ${home.login_button}
    Wait Until Element Is Enabled    ${home.error_login}    60
    Set Focus To Element             ${home.error_login}
    # Validar mensagem de erro
    ${Erro_Login}    Get Text    ${home.error_login}
    Log To Console    Validar mensagem de erro: ${Erro_Login}

Então realizo Logout com Sucesso
    # Validar logout
    Scroll Element Into View         ${home.logout}
    Wait Until Element Is Visible    ${home.logout}    60
    Click Button                     ${home.logout}
    Wait Until Location Is           ${home.expected_url}    60
    ${current_url}=    Get Location
    Should Be Equal As Strings       ${current_url}    ${home.expected_url}

Então validar usuário em atendimento
    # Validar que há usuário em atendimento
    Wait Until Element Is Visible    ${home.service_button}    120
    Scroll Element Into View         ${home.service_button}
    Set Focus To Element             ${home.service_button}
    Click Button                     ${home.service_button}
    Wait Until Element Is Visible    ${home.service_select}    120
    Scroll Element Into View         ${home.service_select}
    Set Focus To Element             ${home.service_select}    
    Click Button                     ${home.service_select}
    # É necessário ter um usuário
    Wait Until Element Is Visible    ${home.img_contact}    120
    Scroll Element Into View         ${home.img_contact}
    Set Focus To Element             ${home.img_contact}
    Click Image                      ${home.img_contact}

Então filtrar por filas
    # Clicar em filtros e filas
    Wait Until Element Is Visible    ${home.all_button}    120
    Wait Until Element Is Enabled    ${home.all_button}    120
    Scroll Element Into View         ${home.all_button} 
    Set Focus To Element             ${home.all_button}
    Click Element                    ${home.all_button}    
    Wait Until Element Is Visible    ${home.filas_button}    120
    Scroll Element Into View         ${home.filas_button}
    Set Focus To Element             ${home.filas_button}
    Click Element                    ${home.filas_button}
    # Deverá apresentar apenas uma caixa de "Filas"
    Wait Until Element Is Visible    ${home.filas_label}    60
    Scroll Element Into View         ${home.filas_label}
    Set Focus To Element             ${home.filas_label}
    ${filas}=    Get WebElements    ${home.filas_label}
    Length Should Be    ${filas}    1

Então validar informações do contato no CRM    
    Wait Until Element Is Visible    ${home.crm}    120
    Scroll Element Into View         ${home.crm}
    Set Focus To Element             ${home.crm}
    Click Element                    ${home.crm}
    # Acessar o funil
    Wait Until Element Is Visible    ${home.funil_crm}    120
    Scroll Element Into View         ${home.funil_crm}
    Set Focus To Element             ${home.funil_crm}
    Click Element                    ${home.funil_crm}
    # É necessário ter um usuário presente
    Wait Until Element Is Visible    ${home.img_contato_crm_1}    120
    Scroll Element Into View         ${home.img_contato_crm_1} 
    Set Focus To Element             ${home.img_contato_crm_1}
    Click Element                    ${home.img_contato_crm_1}
    # Validar o campo "Atividades", validando que não está com tela branca
    Wait Until Element Is Visible    ${home.atividades_crm}    120
    Scroll Element Into View         ${home.atividades_crm}
    Set Focus To Element             ${home.atividades_crm}
    Element Should Be Visible        ${home.atividades_crm}
    # Validar o campo "Informações", validando que não está com tela branca
    Wait Until Element Is Visible    ${home.imformacoes_gerais_crm}    120
    Scroll Element Into View         ${home.imformacoes_gerais_crm}
    Set Focus To Element             ${home.imformacoes_gerais_crm}
    Element Should Be Visible        ${home.imformacoes_gerais_crm}

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
    # Validar o formato do tempo está correto, em 00:00:00
    Wait Until Element Is Visible    ${home.tempo_medio_horas}    120
    Scroll Element Into View    ${home.tempo_medio_horas}
    Set Focus To Element             ${home.tempo_medio_horas}
    ${tempo}=    Get Text    ${home.tempo_medio_horas}
    Log    Valor capturado: ${tempo}
    Should Match Regexp    ${tempo}    ^\\d{2}:\\d{2}:\\d{2}$

# Edição de mensagens em atendimentos
#     # Deverá ter uma mensagem com o texto "Testar edição"
#     Wait Until Element Is Visible    ${home.testar_edição}    60
#     Set Focus To Element             ${home.testar_edição}
#     Click Element                    ${home.testar_edição}
#     Wait Until Element Is Visible    ${home.menu_editar_msgs}    60
#     Set Focus To Element             ${home.menu_editar_msgs}
#     Click Element                    ${home.menu_editar_msgs}
#     Wait Until Element Is Visible    ${home.editar_mensagens}    60
#     Set Focus To Element             ${home.editar_mensagens}
#     Click Element                    ${home.editar_mensagens}
#     Wait Until Element Is Visible    ${home.inserir_msg_edição}    60
#     Set Focus To Element             ${home.inserir_msg_edição}
#     Clear Element Text               ${home.inserir_msg_edição}
#     Input Text                       ${home.inserir_msg_edição}    Mensagem Editada    

Quando acessar o menu Dashboard
    # Validar acesso ao Dashboard
    Wait Until Element Is Visible    ${home.dashboard}    60
    Set Focus To Element             ${home.dashboard}
    Click Element                    ${home.dashboard}
    Wait Until Element Is Enabled    ${home.success_msg}    60
    ${current_url}=    Get Location
    Should Contain                   ${current_url}    dashboard 

E acessar o menu atendimentos
    # Validar acesso à Atendimentos
    Wait Until Element Is Visible    ${home.atendimento_button}    120
    Scroll Element Into View         ${home.atendimento_button} 
    Set Focus To Element             ${home.atendimento_button}
    Sleep    1
    Click Button                     ${home.atendimento_button}

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
    Sleep    2    
    Wait Until Element Is Visible    ${home.personalisado_contexto}    120
    Scroll Element Into View         ${home.personalisado_contexto} 
    Set Focus To Element             ${home.personalisado_contexto}
    Click Element                    ${home.personalisado_contexto} 
    # Clicar em Adicionar Contexto
    Wait Until Element Is Visible    ${home.add_contexto}    120
    Scroll Element Into View         ${home.add_contexto}
    Set Focus To Element             ${home.add_contexto}
    Click Element                    ${home.add_contexto}    
    # Inserir o nome
    Wait Until Element Is Visible    ${home.input_nome_contexto}    120
    Scroll Element Into View         ${home.input_nome_contexto}
    Set Focus To Element             ${home.input_nome_contexto}
    Input Text                       ${home.input_nome_contexto}    teste_qa_teste    
    ${contexto_personalizado}     Get Value    ${home.input_nome_contexto}
    Set Global Variable    ${contexto_personalizado}    ${contexto_personalizado}
    Log To Console    Nome inserido: ${contexto_personalizado}  
    # Selecionar o tipo "Contato"
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'react-select__control')]    120
    Scroll Element Into View         xpath=//div[contains(@class, 'react-select__control')]
    Set Focus To Element             xpath=//div[contains(@class, 'react-select__control')]
    Click Element                    xpath=//div[contains(@class, 'react-select__control')]
    Sleep    1
    Execute JavaScript    document.evaluate("//div[contains(@class, 'react-select__option') and text()='Contato']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()     
    # Salvar contexto personalizado
    Sleep    1
    Wait Until Element Is Visible    ${home.btn_salvar_contexto}    120
    Scroll Element Into View         ${home.btn_salvar_contexto}
    Set Focus To Element             ${home.btn_salvar_contexto}
    Click Element                    ${home.btn_salvar_contexto}    
    Sleep    1
    # Comparar variáveis e validar nome criado
     ${contexto_personalizado_criado}     Get Text  ${home.variavel_nome_contexto_person}
    Set Global Variable    ${contexto_personalizado_criado}    ${contexto_personalizado_criado}
    Log To Console    Nome criado: ${contexto_personalizado_criado}     
    Should Be Equal    ${contexto_personalizado}    ${contexto_personalizado_criado}
    # Clicar no botão excluir
    Wait Until Element Is Visible    ${home.btn_excluir_contexto_person}    120
    Scroll Element Into View         ${home.btn_excluir_contexto_person}
    Set Focus To Element             ${home.btn_excluir_contexto_person}
    Click Element                    ${home.btn_excluir_contexto_person}

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

Então visualizar apenas o modal contatos 
    # Validar que há apenas o menu "Contatos"
    Wait Until Element Is Visible    ${home.contatos_menu}    60
    Set Focus To Element             ${home.contatos_menu}
    Element Should Be Visible        ${home.contatos_menu} 

E validar carrossel
    # Validar que há o carrossel de informações
    Wait Until Element Is Visible    ${home.btn_carrossel_1}    120
    Scroll Element Into View         ${home.btn_carrossel_1}
    Set Focus To Element             ${home.btn_carrossel_1}
    Element Should Be Visible        ${home.btn_carrossel_1}     
    Wait Until Element Is Visible    ${home.btn_carrossel_2}    120
    Scroll Element Into View         ${home.btn_carrossel_2}
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

E acessar o menu empresas
    # validar o acesso ao menu "Empresas"
    Wait Until Element Is Visible    ${home.menu_empresas}    120
    Scroll Element Into View         ${home.menu_empresas}
    Set Focus To Element             ${home.menu_empresas}
    Click Element                    ${home.menu_empresas}
    # Validar o acesso à page
    ${current_url}=    Get Location
    Should Contain                   ${current_url}    companies
    Wait Until Element Is Visible    ${home.page_empresas}    120
    Scroll Element Into View         ${home.page_empresas}
    Set Focus To Element             ${home.page_empresas}
    Element Should Be Visible        ${home.page_empresas}

Quando adicionar empresas
    # Clicar em adicionar empresa
    Wait Until Element Is Visible    ${home.btn_add_empresas}    120
    Scroll Element Into View         ${home.btn_add_empresas}
    Set Focus To Element             ${home.btn_add_empresas}
    Click Element                    ${home.btn_add_empresas}
    # Validar acesso à página "Criar Empresa
    Wait Until Element Is Visible    ${home.page_criar_empresas}    120
    Scroll Element Into View         ${home.page_criar_empresas}
    Set Focus To Element             ${home.page_criar_empresas}
    Element Should Be Visible        ${home.page_criar_empresas}

Então inserir dados da empresa
    # Inserir país de origem do cnpj
    Wait Until Element Is Visible    ${home.input_pais_add_empresa}    120
    Scroll Element Into View         ${home.input_pais_add_empresa}
    Set Focus To Element             ${home.input_pais_add_empresa}
    Input Text                       ${home.input_pais_add_empresa}    Brasil
    Press Keys                       ${home.input_pais_add_empresa}    TAB 
    # Inserir CNPJ
    Wait Until Element Is Visible    ${home.input_cnpj_add_empresa}    120
    Scroll Element Into View         ${home.input_cnpj_add_empresa}
    Set Focus To Element             ${home.input_cnpj_add_empresa}
    Input Text                       ${home.input_cnpj_add_empresa}    34571366000132
    Press Keys                       ${home.input_cnpj_add_empresa}    TAB 
    # Validar que o CEP "25220-690" da empresa está visível
    # Único campo que retorna valor para validação
    Wait Until Element Is Visible        ${home.input_cep_add_empresa}    120
    Scroll Element Into View             ${home.input_cep_add_empresa}
    Set Focus To Element                 ${home.input_cep_add_empresa}
    Element Attribute Value Should Be    ${home.input_cep_add_empresa}    value    25220-690 
    ${cep}=    Get Element Attribute     ${home.input_cep_add_empresa}    value
    Log To Console    O número é: ${cep}   

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

Quando acessar Agentes de IA
    # Validar acesso ao menu Agentes de IA
    Wait Until Element Is Visible    ${home.btn_agentes_ia}    120
    Set Focus To Element             ${home.btn_agentes_ia}
    Click Element                    ${home.btn_agentes_ia}     
    # Validar Home Page "Agentes"
    Wait Until Element Is Visible    ${home.page_agentes}    120
    Set Focus To Element             ${home.page_agentes}
    Element Should Be Visible        ${home.page_agentes} 
    ${page_agentes}    Get Text    ${home.page_agentes}
    Log To Console    Page: ${page_agentes}
    Should Be Equal    ${page_agentes}    Agentes

Quando criar agentes de ia
    # Adicionar Agente
    Wait Until Element Is Visible    ${home.btn_add_agente}    150
    Scroll Element Into View         ${home.btn_add_agente}
    Set Focus To Element             ${home.btn_add_agente}
    Click Element                    ${home.btn_add_agente}    
    # Inserir nome aleatório do agente e guardar em variável
    # Será editado o agente conforme cada criação
    Wait Until Element Is Visible    ${home.input_nome_agente_ia}    150
    Set Focus To Element             ${home.input_nome_agente_ia}
    ${numero}    Generate Random String    5    [NUMBERS]
    ${nome_agente}    Set Variable    QA_Agente_${numero}
    Input Text    ${home.input_nome_agente_ia}    ${nome_agente}
    ${nome_agente}    Get Value    ${home.input_nome_agente_ia}
    Set Global Variable    ${nome_agente}    ${nome_agente}
    Log To Console    Page: ${nome_agente}
    # Salvar Agente IA
    Wait Until Element Is Visible    ${home.salvar_agentesIA}    150
    Scroll Element Into View         ${home.salvar_agentesIA}
    Set Focus To Element             ${home.salvar_agentesIA}
    Click Element                    ${home.salvar_agentesIA}
    # Aguardar até que não esteja mais visível "Agente criado com sucesso"
    Wait Until Element Is Visible       ${home.agente_criado_sucesso}    150
    Scroll Element Into View            ${home.agente_criado_sucesso}
    Set Focus To Element                ${home.agente_criado_sucesso}
    Wait Until Page Does Not Contain    ${home.agente_criado_sucesso}    150
    # Agora clicar no botão Editar do agente criado
    # Espera a tabela aparecer
    Wait Until Element Is Visible    //tbody    150
    # Localiza o td que contém o nome do agente
    ${nome_agente_tabela}    Get Text    //td[@data-label='Nome' and normalize-space()='${nome_agente}']
    Log To Console    Nome do agente na tabela: ${nome_agente_tabela}
    # Localiza o botão Editar na mesma linha
    ${editar_botao}    Set Variable    //td[@data-label='Nome' and normalize-space()='${nome_agente}']/following-sibling::td//button[1]//*[name()='svg']
    # Clicar no botão Editar
    Wait Until Element Is Visible    ${editar_botao}    150
    Scroll Element Into View         ${editar_botao}
    Set Focus To Element             ${editar_botao}
    Click Element                    ${editar_botao}

E editar agentes de IA
    
    # Inserir perfil do Agente e regras de negócios
    Sleep    1
    Scroll Element Into View    //label[contains(text(),'Faça uma breve descrição de como deve ser este per')]
    Wait Until Element Is Visible    ${home.input_perfil_IA}    150
    Scroll Element Into View         ${home.input_perfil_IA}
    Set Focus To Element             ${home.input_perfil_IA}
    Input Text                       ${home.input_perfil_IA}    ${home.perfil_agente}
    Wait Until Element Is Visible    ${home.regras_negocios_ia}    150
    Scroll Element Into View         ${home.regras_negocios_ia}
    Set Focus To Element             ${home.regras_negocios_ia}
    Input Text                       ${home.regras_negocios_ia}    ${home.input_regras_negocios}
    # Clicar em próximo
    Wait Until Element Is Visible    ${home.btn_proximo}    150
    Scroll Element Into View         ${home.btn_proximo}
    Set Focus To Element             ${home.btn_proximo}
    Click Element                    ${home.btn_proximo}    
    # Aguardar até que não esteja mais visível "Atualização de agente"
    Wait Until Element Is Visible       ${home.msg_atualizando_ag_ia}    150
    Scroll Element Into View            ${home.msg_atualizando_ag_ia}
    Set Focus To Element                ${home.msg_atualizando_ag_ia}
    Wait Until Page Does Not Contain    ${home.msg_atualizando_ag_ia}    150

E editar base de conhecimento | agentes de IA    
    # Inserir base de conhecimento do Agente IA e Salvar
    Scroll Element Into View         ${home.base_conhecimento_page}
    Wait Until Element Is Visible    ${home.input_base_conhecimento}    150
    Scroll Element Into View         ${home.input_base_conhecimento}
    Set Focus To Element             ${home.input_base_conhecimento}
    Input Text                       ${home.input_base_conhecimento}    ${home.text_conhecimento_agente}
    Wait Until Element Is Visible    ${home.salvar_agentesIA}    150
    Scroll Element Into View         ${home.salvar_agentesIA}
    Set Focus To Element             ${home.salvar_agentesIA}
    Click Element                    ${home.salvar_agentesIA}
    # Aguardar até que não esteja mais visível "Atualização de agente"
    Wait Until Element Is Visible       ${home.msg_atualizando_ag_ia}    150
    Scroll Element Into View            ${home.msg_atualizando_ag_ia}
    Set Focus To Element                ${home.msg_atualizando_ag_ia}
    Wait Until Page Does Not Contain    ${home.msg_atualizando_ag_ia}    150
    # Clicar em próximo
    Wait Until Element Is Visible    ${home.btn_proximo}    150
    Scroll Element Into View         ${home.btn_proximo}
    Set Focus To Element             ${home.btn_proximo}
    Click Element                    ${home.btn_proximo}    
    # Aguardar até que não esteja mais visível "Atualização de agente"
    Wait Until Element Is Visible       ${home.msg_atualizando_ag_ia}    150
    Scroll Element Into View            ${home.msg_atualizando_ag_ia}
    Set Focus To Element                ${home.msg_atualizando_ag_ia}
    Wait Until Page Does Not Contain    ${home.msg_atualizando_ag_ia}    150
    # Clicar em próximo
    Wait Until Element Is Visible    ${home.btn_proximo}    150
    Scroll Element Into View         ${home.btn_proximo}
    Set Focus To Element             ${home.btn_proximo}
    Click Element                    ${home.btn_proximo}
    # Clicar em próximo
    Wait Until Element Is Visible    ${home.btn_proximo}    150
    Scroll Element Into View         ${home.btn_proximo}
    Set Focus To Element             ${home.btn_proximo}
    Click Element                    ${home.btn_proximo}
    # Aguardar até que não esteja mais visível "Atualização de agente"
    Wait Until Element Is Visible       ${home.msg_atualizando_ag_ia}    150
    Scroll Element Into View            ${home.msg_atualizando_ag_ia}
    Set Focus To Element                ${home.msg_atualizando_ag_ia}
    Wait Until Page Does Not Contain    ${home.msg_atualizando_ag_ia}    150

Então testar o Agente de IA
    # Inserir mensagem para testar Agente de IA
    Sleep    1
    Wait Until Element Is Visible    ${home.input_msg_teste_ia}    150
    Execute Javascript    document.evaluate("${home.input_msg_teste_ia}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.value = '${home.perguntar_nome}';
    Press Key    ${home.input_msg_teste_ia}    ENTER
    # Clicar em enviar
    Sleep    1
    Wait Until Element Is Visible    ${home.btn_enviar_msg}    150
    Scroll Element Into View         ${home.btn_enviar_msg}
    Set Focus To Element             ${home.btn_enviar_msg}
    Click Element                    ${home.btn_enviar_msg}
    # Aguardar carregar teste do agente de IA
    Wait Until Element Is Visible        ${home.loading_testar_ia}    150
    Scroll Element Into View             ${home.loading_testar_ia}
    Set Focus To Element                 ${home.loading_testar_ia}
    Wait Until Element Is Not Visible    ${home.loading_testar_ia}    150
    Run Keyword And Ignore Error    Element Should Not Be Visible        ${home.loading_testar_ia}    
    # Validar que a resposta contém o nome "Douglas Tavares"
    Sleep    1
    Wait Until Element Is Visible    ${home.resposta_nome}    150
    Scroll Element Into View         ${home.resposta_nome}   
    Set Focus To Element             ${home.resposta_nome}
    ${resposta}    Get Text    ${home.resposta_nome}
    Log To Console    >>> RESPOSTA DO AGENTE: ${resposta}
    Should Match Regexp    ${resposta}    .*Douglas Tavares.*

E acessar à funcionalidade CRM em relatórios
    # Clicar em CRM
    Wait Until Element Is Visible    ${home.crm_relatorios}    120
    Scroll Element Into View         ${home.crm_relatorios}
    Set Focus To Element             ${home.crm_relatorios}
    Click Element                    ${home.crm_relatorios}
    # Validar acesso à página CRM
    Wait Until Element Is Visible    ${home.page_crm_relatorios}    120
    Scroll Element Into View         ${home.page_crm_relatorios}
    Set Focus To Element             ${home.page_crm_relatorios}
    Element Should Be Visible        ${home.page_crm_relatorios}   

Então validar as colunas 
    # Validar acesso à coluna oportunidade
    Wait Until Element Is Visible    ${home.coluna_crm_oportunidade}    120
    Scroll Element Into View         ${home.coluna_crm_oportunidade}
    Set Focus To Element             ${home.coluna_crm_oportunidade}
    Element Should Be Visible        ${home.coluna_crm_oportunidade}
    Log To Console    >>> Coluna "Oportunidade" visível com sucesso ✅
    # Validar acesso à coluna contato
    Wait Until Element Is Visible    ${home.coluna_crm_contato}    120
    Scroll Element Into View         ${home.coluna_crm_contato}
    Set Focus To Element             ${home.coluna_crm_contato}
    Element Should Be Visible        ${home.coluna_crm_contato}
    Log To Console    >>> Coluna "Contato" visível com sucesso ✅
    # Validar acesso à coluna conexão
    Wait Until Element Is Visible    ${home.coluna_crm_conexao}    120
    Scroll Element Into View         ${home.coluna_crm_conexao}
    Set Focus To Element             ${home.coluna_crm_conexao}
    Element Should Be Visible        ${home.coluna_crm_conexao}
    Log To Console    >>> Coluna "Conexão" visível com sucesso ✅
    # Validar acesso à coluna usuários
    Wait Until Element Is Visible    ${home.coluna_crm_usuarios}    120
    Scroll Element Into View         ${home.coluna_crm_usuarios}
    Set Focus To Element             ${home.coluna_crm_usuarios}
    Element Should Be Visible        ${home.coluna_crm_usuarios}
    Log To Console    >>> Coluna "Usuários" visível com sucesso ✅
    # Validar acesso à coluna valor
    Wait Until Element Is Visible    ${home.coluna_crm_valor}    120
    Scroll Element Into View         ${home.coluna_crm_valor}
    Set Focus To Element             ${home.coluna_crm_valor}
    Element Should Be Visible        ${home.coluna_crm_valor}
    Log To Console    >>> Coluna "Valor" visível com sucesso ✅
    # Validar acesso à coluna status
    Wait Until Element Is Visible    ${home.coluna_crm_status}    120
    Scroll Element Into View         ${home.coluna_crm_status}
    Set Focus To Element             ${home.coluna_crm_status}
    Element Should Be Visible        ${home.coluna_crm_status}
    Log To Console    >>> Coluna "Status" visível com sucesso ✅
    # Validar acesso à coluna data de criação
    Wait Until Element Is Visible    ${home.coluna_crm_data_criacao}    120
    Scroll Element Into View         ${home.coluna_crm_data_criacao}
    Set Focus To Element             ${home.coluna_crm_data_criacao}
    Element Should Be Visible        ${home.coluna_crm_data_criacao}
    Log To Console    >>> Coluna "Data de Criação" visível com sucesso ✅
    # Validar acesso à coluna data de finalização
    Wait Until Element Is Visible    ${home.coluna_crm_data_finalizacao}    120
    Scroll Element Into View         ${home.coluna_crm_data_finalizacao}
    Set Focus To Element             ${home.coluna_crm_data_finalizacao}
    Element Should Be Visible        ${home.coluna_crm_data_finalizacao}
    Log To Console    >>> Coluna "Data de Finalização" visível com sucesso ✅
    # Validar acesso à coluna origem
    Wait Until Element Is Visible    ${home.coluna_crm_origem}    120
    Scroll Element Into View         ${home.coluna_crm_origem}
    Set Focus To Element             ${home.coluna_crm_origem}
    Element Should Be Visible        ${home.coluna_crm_origem}
    Log To Console    >>> Coluna "Origem" visível com sucesso ✅
    # Validar acesso à coluna título do anúncio
    Wait Until Element Is Visible    ${home.coluna_crm_titulo_anuncio}    120
    Scroll Element Into View         ${home.coluna_crm_titulo_anuncio}
    Set Focus To Element             ${home.coluna_crm_titulo_anuncio}
    Element Should Be Visible        ${home.coluna_crm_titulo_anuncio}
    Log To Console    >>> Coluna "Título do anúncio" visível com sucesso ✅