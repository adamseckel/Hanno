Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
	root "static#index"

  get "/contact" => "static#contact", as: "contact_index"

  # patch "/projects/done/:id" => "projects#done", as: :task_done

  resources :projects do
    resources :tasks, only: [:create, :update, :destroy]
    resources :discussions, only: [:create, :update, :destroy]
    resources :favourites, only: [:create, :destroy]
  end

  resources :discussions, only: [] do
    resources :comments, only: [:create, :update, :destroy]
  end

  resources :comments, only: [] do
    resources :likes, only: [:create, :destroy]
  end
  
end
