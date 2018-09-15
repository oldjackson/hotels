Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  get '/' => 'api/v1/hotels#index' # for the sign_in rspec
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :hotels, only: [:index]
    end
  end

  require "sidekiq/web"
  authenticate :user, ->(u) { u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
