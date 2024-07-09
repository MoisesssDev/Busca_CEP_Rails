require 'net/http'
require 'json'

class CepSearchController < ApplicationController
  def index
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
        @cep = format_response['cep']
        @address = format_response['address']
        @district = format_response['district']
        @city = format_response['city']
        @state = format_response['state']
        @ddd = format_response['ddd']
      end
    end
  end
end
