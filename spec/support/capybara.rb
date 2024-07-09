require 'capybara/rails'
require 'capybara/rspec'

# Configuração para usar o driver padrão `rack_test`
Capybara.default_driver = :rack_test

# Outras configurações opcionais
Capybara.default_max_wait_time = 5