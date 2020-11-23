Rails.application.routes.draw do
  namespace :admin do
    resources :users do
      collection do
        post :confirm
      end
    end
  end

  devise_for :users

  #Home 
  root to: "home#index"

  resources :users,  only: [:new, :create, :show, :destroy, :index]

  resources :events do
    collection do
      post :confirm
    end
  end

  resources :participants,  only: [:index] do
    match '/join', to: 'participants#join_event', via: :post, on: :collection 
    match '/canceled', to: 'participants#canceled_event', via: :post, on: :collection
  end

    #routes to errors
  match "404", :to => 'errors#not_found', :via => :all
  match "500", :to => 'errors#internal_error', :via => :all

end
