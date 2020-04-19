Quando("eu insiro meus dados de cadastro") do
    # Carrega a pagina
    user.load()
    # Preencho os dados do usuario
    user.preencher_usuario
    sleep(5)
end
  
Entao("eu verifico se o usuário foi cadastrado.") do
    texto = user.mensagem
    expect(texto.text).to eq 'Usuário Criado com sucesso'
    sleep(2)
end