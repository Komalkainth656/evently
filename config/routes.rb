Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
 get "/", to: "welcome#root", as: 'root'
 resources :events do
  resources :tags, only: [:create, :destroy]
end
end
