Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "translates#index"
  namespace 'api' do
    namespace 'public' do
      resources :users
    end
  end
end
