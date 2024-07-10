require 'rails_helper'

describe 'Usurario ver ranking de CEPs', type: :feature do
  it 'e ver os 5 mais buscados' do
    CepSearch.create(cep: '01311-000', count: 5)
    CepSearch.create(cep: '01311-001', count: 4)
    CepSearch.create(cep: '01311-002', count: 3)
    CepSearch.create(cep: '01311-003', count: 2)
    CepSearch.create(cep: '01311-004', count: 1)
    CepSearch.create(cep: '01311-005', count: 1)

    visit root_path

    expect(page).to have_content('CEPs mais buscados')
    expect(page).to have_content('01311-000')
    expect(page).to have_content('01311-001')
    expect(page).to have_content('01311-002')
    expect(page).to have_content('01311-003')
    expect(page).to have_content('01311-004')
    expect(page).not_to have_content('01311-005')
  end

  it 'e ainda não foi existem CEPs buscados' do
    visit root_path

    expect(page).to have_content('CEPs mais buscados')
    expect(page).to have_content('Nenhum CEP foi buscado ainda.')
  end
end