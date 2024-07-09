require 'rails_helper'

RSpec.describe "cep_search/index.html.tailwindcss", type: :feature do
  it 'Busca por CEP válido' do
    visit root_path
    fill_in 'cep', with: '01311-000'
    click_button 'Buscar'

    expect(page).to have_content('Avenida Paulista')
  end
end
