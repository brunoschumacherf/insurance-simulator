Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :admins
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post 'api/login/signin', to: 'login#signin'
  post 'api/login/signup', to: 'login#signup'
  post 'api/login/signout', to: 'login#signout'
  get 'api/login/user_map', to: 'login#user_map'
  post '/api/users', to: 'admin#get_users'
  get '/api/users/:id', to: 'admin#get_user'
  post '/api/insurances', to: 'admin#get_insurances'
  get '/api/insurances/:id', to: 'admin#get_insurance'
  post 'api/insurance/create', to: 'insurances#create'
  get 'api/insurance/:id', to: 'insurances#get_insurance'
  get 'api/insurances', to: 'insurances#get_insurances'
  post 'api/roof/create', to: 'roofs#create'
  get 'api/roofs/:insurance_id', to: 'roofs#get_roofs'

  post 'api/admin/login', to: 'admin#login_admin'
  post 'api/admin/create', to: 'admin#create_admin'
  post 'api/simulator/', to: 'admin#simulate'
  get 'api/admin/insurances', to: 'admin#get_insurances'
  get 'api/admin/insurances/:id', to: 'admin#get_insurance'
  get 'api/admin/users', to: 'admin#get_users'
  get 'api/admin/users/:id', to: 'admin#get_user'
  get 'api/admin/roofs/:id', to: 'admin#get_roofs'
  post 'api/admin/signout', to: 'admin#signout_admin'


  # Defines the root path route ("/")
  # root "articles#index"
end
