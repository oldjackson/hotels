Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  get '/' => "rails/welcome#index"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :hotels, only: [ :index ]
    end
  end

end
