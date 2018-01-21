class LoginController < ApplicationController
  require 'httparty'


  def validate
    @login = Login.new
  end

  def validate_request
    urlstring_to_post = "http://localhost:3002/rest/login" # TODO: replace with global variable
    @response = HTTParty.post(urlstring_to_post.to_str, :body => params[:login].to_json, :headers => { 'Content-Type' => 'application/json' } )
    end
end
