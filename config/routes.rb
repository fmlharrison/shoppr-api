Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :shops do
    resource :list do
      resources :items
    end
  end
end
