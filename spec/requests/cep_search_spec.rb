require 'rails_helper'

RSpec.describe 'CepSearches', type: :request do
  describe 'GET /index' do
    it 'Busca por CEP válido' do
      get root_path, params: { cep: '01311-000' }
      expect(response).to have_http_status(:success)
    end
  end

end
