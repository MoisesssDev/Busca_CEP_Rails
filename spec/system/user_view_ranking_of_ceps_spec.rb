require 'rails_helper'

describe 'Usurario ver ranking de CEPs', type: :feature do
  it 'e ver os 5 mais buscados' do
    CepSearch.create!(cep: '01311-000', city: 'São Paulo', state: 'SP', count: 5)
    CepSearch.create!(cep: '01311-001', city: 'São Paulo', state: 'SP', count: 3)
    CepSearch.create!(cep: '01311-002', city: 'São Paulo', state: 'SP', count: 2)
    CepSearch.create!(cep: '01311-003', city: 'São Paulo', state: 'SP', count: 2)
    CepSearch.create!(cep: '01311-004', city: 'São Paulo', state: 'SP', count: 2)
    CepSearch.create!(cep: '01311-005', city: 'São Paulo', state: 'SP', count: 1)

    visit root_path

    expect(page).to have_content('CEPs mais buscados')
    expect(page).to have_content('01311-000')
    expect(page).to have_content('01311-001')
    expect(page).to have_content('01311-002')
    expect(page).to have_content('01311-003')
    expect(page).to have_content('01311-004')
    expect(page).not_to have_content('01311-005')
  end
end