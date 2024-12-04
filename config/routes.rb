Rails.application.routes.draw do
  post '', to: 'taxes#calculate'

  resource :tax, only: [] do
    get :calculator
  end

  root 'taxes#calculator'
end
