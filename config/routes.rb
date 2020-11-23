Rails.application.routes.draw do
  #Home 
  root to: "home#index"
  
  devise_for :users
end
