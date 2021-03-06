Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "main#index"

  get "import_data", to: "import_data#new"
  post "import_data", to: "import_data#create"

  get "movies", to: "movies#index"

  get "new_search_actor", to: "search_actor#new"
  post "search_actor", to: "search_actor#create"
  resources :actors, only: [:show]
end
