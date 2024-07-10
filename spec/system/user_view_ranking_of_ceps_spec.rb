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

  it 'e ver os 5 mais buscados por estado' do
    CepSearch.create(cep: '01311-000', count: 5, state: 'SP')
    CepSearch.create(cep: '01311-001', count: 5, state: 'RJ')
    CepSearch.create(cep: '01311-002', count: 5, state: 'SE')
    CepSearch.create(cep: '01311-003', count: 5, state: 'CE')
    CepSearch.create(cep: '01311-004', count: 5, state: 'RS')
    CepSearch.create(cep: '01311-005', count: 3, state: 'RJ')

    visit root_path

    expect(page).to have_content('CEPs mais buscados por estado')
    expect(page).to have_content('SP - 01311-000')
    expect(page).to have_content('RJ - 01311-001')
    expect(page).to have_content('SE - 01311-002')
    expect(page).to have_content('CE - 01311-003')
    expect(page).to have_content('RS - 01311-004')
    expect(page).not_to have_content('RJ - 01311-005')
  end
end