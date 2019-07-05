Rails.application.routes.draw do
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'welcome/home', to: 'welcome#home' =>
  root 'welcome#home' #pagina index
  #get 'welcome/about', to: 'welcome#about' =>
  get 'about', to: 'welcome#about'
end
