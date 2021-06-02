Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  namespace 'api' do
    namespace 'v1' do
      
      mount_devise_token_auth_for 'User', at: 'auth'

      get "movies/fetch_movies", to: "movies#fetch"
      get "/movies/:id", to: "movies#show"
      post "movies/:id/rating", to: "movies#rating", as: 'rating'
      resources :movie_catalogs, only: [:index, :create, :update, :destroy]
    end
  end
end
