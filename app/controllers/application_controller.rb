class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  API_HOST = (Rails.env.development? or Rails.env.test?) ?  "http://localhost:3002" : "https://login-jisanchez.herokuapp.com"
end
