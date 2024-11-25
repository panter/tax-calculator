Rails.application.routes.draw do
  get '', to: 'taxes#calculator'

  resource :tax, only: [] do
    post :calculate
  end
end
