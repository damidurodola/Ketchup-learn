Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :courses

  get '/', to: 'home#index'
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  post 'courses/:id/enroll', to: 'courses#enroll'
  get  'user/my_courses', to: 'users#enrolled_courses'
end
