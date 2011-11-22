ARails31Demo::Application.routes.draw do
  
  get 'pages/home'
  root :to => 'posts#index'
  post 'login', :to => 'sessions#create'
  match 'login', :to => 'sessions#new', :as => 'login'
  match 'logout', :to => 'sessions#destroy', :as => 'logout'
  
  resources :posts do
    resources :sections do
      resources :snippets
    end
  end
end
