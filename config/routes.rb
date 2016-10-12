Rails.application.routes.draw do
# For no apparent reason, these had to be commented out and the below pasted. We're not sure why it works (including Lukas)
#   get 'profiles/:id' => 'profiles#show', as: :profile

#   get 'profiles' => 'profiles#index'

#   devise_for :users

# # Below is a nested resource, which generates 
#   resources :tweets do
#   	resources :likes
#   end

#   resources :relationships

#   root 'tweets#index'


# end

  get 'profiles/index'
  get 'profiles/show'
  devise_for :users
  # post 'tweets' => 'tweets#create'
  # get 'tweets/new' => 'tweets#new', as: 'new/tweet'
  # get 'tweets' => 'tweets#index'
  # get 'tweets/:id' => 'tweets#show', as: :tweet
  # get 'tweets/:id/edit' => 'tweets#edit', as: 'edit/tweet'
  # put 'tweets/:id' => 'tweets#update'
  # patch 'tweets/:id' => 'tweets#update'
  # delete 'tweets/:id' => 'tweets#destroy'
  get "profiles/:id" => "profiles#show", as: :profile
  get "profiles" => "profiles#index"
  get "feed" => 'profiles#feed'
  root 'tweets#index'
  resources :relationships, only: [:create, :destroy]
  resources :tweets do
    resource :like, only: [:create, :destroy]
end
  end