Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'

  namespace 'api' do #folder name that we have created in controller folder for CRUD
    namespace 'v1' do
      resources :employee
      get 'employee/list'
      post 'employee/search_query'
    end
  end
end
