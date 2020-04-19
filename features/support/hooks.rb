# Após a execução de cada cenario uma foto é tirada
After do |scenario|
    # Subtituir todos os espaços por '_' Usando regex (gsub) 
    scenario_name = scenario.name.gsub(/\s+/,'_').tr('/','_')
    # Verifica se o cenario falhou ou Passou
    if scenario.failed?
        #coloca o nome recebido em letra minuscula e executa o metodo
        tirar_foto(scenario_name.downcase!, 'Falhou')
    else
        tirar_foto(scenario_name.downcase!, 'Passou')
    end
end