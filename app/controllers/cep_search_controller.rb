require 'net/http'
require 'json'

class CepSearchController < ApplicationController
  def index
    @most_searched = CepSearch.order(count: :desc).limit(3)
    @most_searched_by_state = CepSearch.group(:state).order('count DESC').limit(3)

    if params[:cep].present?
      url = "https://cep.awesomeapi.com.br/json/#{params[:cep]}"
      uri = URI(url)

      response = Net::HTTP.get(uri)
      format_response = JSON.parse(response)

      if format_response['code'] == 'invalid'
        @error = 'CEP inválido, tente digitar novamente.'
      
      elsif format_response['code'] == 'not_found'
        @error = 'CEP não encontrado.'
      else
        @address = format_response
        add_to_ranking(@address)
      end
    end

    @quantity_by_state = CepSearch.group(:state).count
  end

  private

  def add_to_ranking(address)
    cep = CepSearch.find_or_initialize_by(cep: address['cep'])
    cep.count = cep.count.to_i + 1

    if cep.new_record?
      cep.state = address['state']
      cep.city = address['city']
    end
    
    cep.save
  end
end
