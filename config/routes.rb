Rails.application.routes.draw do

  resources :questions do
    resources :answers, only: [:index, :show, :create] do
      post 'vote-best'
    end
  end

  get '/auth/:provider/callback', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  get '*unmatched_route', to: 'application#raise_not_found'

  root 'questions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
