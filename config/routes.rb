Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :users do
        resources :patients, only: [:index, :show, :create]
        resources :doctors, only: [:index, :show, :create]
      end
    end
  end
end
