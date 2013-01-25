FedBrand::Application.routes.draw do
  scope "(:locale)", locale: /en|ru/ do
    ActiveAdmin.routes(self)
    devise_for :users, ActiveAdmin::Devise.config

    resources :experts, only: %w(index show) do
      collection do
        match '/:year/:month' => 'experts#monthly', as: :monthly
      end
    end
    resources :news, only: %w(index show) do
      collection do
        get 'tags/:tag', to: 'news#tags', as: :tag
        get '/:category', to: 'news#category', as: :category
      end
    end
    resources :ratings, only: %w(index)
    resources :quotes, controller: "opinions", only: %w(index)
    resources :awards, only: %w(index) do
      collection do
        get "organizers"
        get "nominees"
        match 'archive(/:id)' => 'awards#archive', as: :archive
      end
    end
    root to: 'pages#index'

    get "contacts" => "pages#contacts"
  end
end
