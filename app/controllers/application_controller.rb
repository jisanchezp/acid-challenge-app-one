class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  API_HOST = Figaro.env.api_host

end
