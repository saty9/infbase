Rails.application.routes.draw do
  post 'refresh', controller: :refresh, action: :create
  post 'signin', controller: :signin, action: :create
  post 'signup', controller: :signup, action: :create
  delete 'signin', controller: :signin, action: :destroy
  get 'me', controller: :users, action: :me

  resources :answers
  resources :questions
  resources :teaching_sessions
  resources :course_members
  resources :courses

  scope '/users/:id' do
    get '/courses', action: :courses, controller: 'users/related'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#home"
end
