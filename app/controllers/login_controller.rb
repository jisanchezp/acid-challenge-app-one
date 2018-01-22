class LoginController < ApplicationController
  require 'httparty'

  def validate
    @login = Login.new
  end

  def validate_request
    params[:login][:image] =  helpers.file_to_base64(params[:login][:image])
    @response = HTTParty.post(
      "#{API_HOST}/rest/login",
      :body => params[:login].to_json,
      :headers => {
        'Content-Type' => 'application/json'
      }
    )
    render status: @response.code
    end
end
