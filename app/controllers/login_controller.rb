class LoginController < ApplicationController
  require 'httparty'
  include Base64Helper

  def validate
    @login = Login.new
  end

  def validate_request
    params[:login][:image] =  file_to_url_safe_base64(params[:login][:image])
    @response = HTTParty.post(
      "#{API_HOST}/rest/login",
      :body => params[:login].to_json,
      :headers => {
        'Content-Type' => 'application/json',
        'User-Agent' => request.user_agent
      }
    )
    render status: @response.code
    end
end
