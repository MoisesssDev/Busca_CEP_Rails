require 'rails_helper'

describe 'Usurario ver ranking de CEPs', type: :feature do
  it 'e ver os 3 mais buscados' do
    CepSearch.create(cep: '01311000', count: 5)
    CepSearch.create(cep: '01311001', count: 4)
    CepSearch.create(cep: '01311002', count: 3)
    CepSearch.create(cep: '01311003', count: 2)
    CepSearch.create(cep: '01311004', count: 1)
    CepSearch.create(cep: '01311005', count: 1)

    visit root_path

    expect(page).to have_content('CEPs mais buscados')
    expect(page).to have_content('1º 01311000 - 5 buscas')
    expect(page).to have_content('2º 01311001 - 4 buscas')
    expect(page).to have_content('3º 01311002 - 3 buscas')
    expect(page).not_to have_content('4º 01311003 - 2 buscas')
    expect(page).not_to have_content('5º 01311004 - 1 buscas')
    expect(page).not_to have_content('6º 01311005 - 1 buscas')
  end

  it 'e ainda não foi existem CEPs buscados' do
    visit root_path

    expect(page).to have_content('CEPs mais buscados')
    expect(page).to have_content('Nenhum CEP foi buscado ainda.')
  end

  it 'e ver os 3 mais buscados por estado' do
    CepSearch.create(cep: '01311-000', count: 6, state: 'SP', city: 'São Paulo')
    CepSearch.create(cep: '01311-001', count: 6, state: 'RJ', city: 'Rio de Janeiro')
    CepSearch.create(cep: '01311-002', count: 6, state: 'SE', city: 'Aracaju')
    CepSearch.create(cep: '01311-003', count: 5, state: 'CE', city: 'Fortaleza')
    CepSearch.create(cep: '01311-004', count: 5, state: 'RS', city: 'Porto Alegre')
    CepSearch.create(cep: '01311-005', count: 3, state: 'RJ', city: 'Monteiro Lobato')

    visit root_path

    expect(page).to have_content('Mais buscados por estado')
    expect(page).to have_content('São Paulo : 01311-000 - SP')
    expect(page).to have_content('Rio de Janeiro : 01311-001 - RJ')
    expect(page).to have_content('Aracaju : 01311-002 - SE')
    expect(page).not_to have_content('Fortaleza : 01311-003 - CE')
    expect(page).not_to have_content('Porto Alegre : 01311-004 - RS')
    expect(page).not_to have_content('Monteiro Lobato : 01311-005 - RJ')
  end
end