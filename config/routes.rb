Rails.application.routes.draw do
  root 'welcome#index'

  get 'combo' => 'welcome#combo'
  get 'recommend' => 'welcome#recommend'

  resources :shops do
    get :cart
    get :order, to: 'orders#new'
    resources :categories
    scope shallow_path: 'shop' do
      resources :items, shallow: true
    end

    resources :orders, except: [:edit, :update, :destroy]
    resources :reviews
  end

  namespace :my do
    resources :reviews, only: [:index]
    resources :orders, only: [:index, :show]
  end
end
