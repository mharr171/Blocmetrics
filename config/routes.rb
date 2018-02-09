Rails.application.routes.draw do
  get 'events/new'

  get 'events/create'

  get 'events/edit'

  get 'events/update'

  get 'events/destroy'

  devise_for :users, controllers: { registrations: 'registrations' }
  root 'welcome#index'

  resources :applications

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
