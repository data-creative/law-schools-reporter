Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :schools, param: :uuid, only: [:index, :show]

      get '/reports/search', to: 'employment_reports#search'
    end
  end
end
