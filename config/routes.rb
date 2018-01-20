Rails.application.routes.draw do
  root 'login#validate'
  get 'validate/', to: 'login#validate'
  post 'validate/', to: 'login#validate_request'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
