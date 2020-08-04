Rails.application.routes.draw do
 get "/", to: "welcome#root", as: 'root'
resources :events
end
