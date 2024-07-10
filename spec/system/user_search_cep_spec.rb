require 'rails_helper'

describe 'Usuario visualiza homepage e', type: :feature do
  it 'Busca por CEP válido' do
    visit root_path
    fill_in 'cep', with: '01311-000'
    click_button 'Buscar'

    expect(page).to have_content('01311000')
    expect(page).to have_content('Avenida Paulista')
    expect(page).to have_content('Bela Vista')
    expect(page).to have_content('São Paulo')
    expect(page).to have_content('SP')
    expect(page).to have_content('11')   
  end

  it 'Busca por CEP inválido' do
    visit root_path
    fill_in 'cep', with: '311-000'
    click_button 'Buscar'

    expect(page).to have_content('CEP inválido, tente digitar novamente.')
  end

  it 'Busca por CEP inexistente' do
    visit root_path
    fill_in 'cep', with: '99999-999'
    click_button 'Buscar'

    expect(page).to have_content('CEP não encontrado.')
  end
end
