Rails.application.routes.draw do
  resources :usuarios, only: [:index] do
    resources :recetas, only: [:index, :show, :create, :update, :destroy]
    resources :secciones, only: [:index, :create, :update, :destroy] do
      resources :subsecciones, only: [:index, :create, :update, :destroy], controller: 'secciones'
      resources :recetas, only: [:create], controller: 'seccion_recetas'
    end
  end
  delete '/recetas/:id', to: 'recetas#destroy'
end

