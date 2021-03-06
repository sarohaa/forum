Rails.application.routes.draw do
  resources :birds
  resources :categories
  root 'home#index'
	get '/myquestions', to: 'home#myques'
  get '/catques', to: 'home#catques'
   get 'search', to: 'search#search'
resources :chat_rooms, only: [:new, :create, :show, :index,:destroy]
  resources :questions do 
  	resources :answers do
  		member do
  			put "like", to: "answers#upvote"
        put "unlike", to: "answers#downvote"

  	    end
      end
  end
  mount ActionCable.server => '/cable'
  devise_for :users
  #match ":controller(/:action(/:id))" , :via => [:get,:post,:patch]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
