Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace('api') do
    namespace('v1') do
      scope controller: 'cities', path: 'cities' do
        post 'nearest', action: 'nearest', as: 'nearest_city'
      end
      match '*path', to: 'not_found#not_found', via: :all
    end
  end
end
