class LoginController < ApplicationController
  require 'httparty'

  def validate
    @login = Login.new
  end

  def validate_request
    @response = HTTParty.post("#{API_HOST}/rest/login", :body => params[:login].to_json, :headers => { 'Content-Type' => 'application/json' } )
    end
end
