Rails.application.routes.draw do
  root 'logins#new'
  resources :logins, :only => [:new, :create]
end
