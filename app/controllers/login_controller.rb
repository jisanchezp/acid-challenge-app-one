class LoginController < ApplicationController
  require 'httparty'


  def validate
    @login = Login.new
  end

  def validate_request
    urlstring_to_post = "http://localhost:3000/#" # \#  TODO: replace with  REST API call url
    response = HTTParty.post(urlstring_to_post.to_str, :body => params[:login].to_json, :headers => { 'Content-Type' => 'application/json' } )

    parsed_response = JSON.parse(response)
    render json: response
  end
end
