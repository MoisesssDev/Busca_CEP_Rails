require 'net/http'
require 'json'

class CepSearchController < ApplicationController
  def index
    if params[:cep].present?
      url = "https://cep.awesomeapi.com.br/json/#{params[:cep]}"
      uri = URI(url)

      response = Net::HTTP.get(uri)
      @address = JSON.parse(response)
    end
  end
end
