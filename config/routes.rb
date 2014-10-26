Rails.application.routes.draw do
	root "static#index"

  get "/contact" => "static#contact", as: "contact_index"

  resources :projects
 
end
