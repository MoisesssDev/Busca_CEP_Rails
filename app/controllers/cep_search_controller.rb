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
        @address = format_response
      end
    end
  end
end
