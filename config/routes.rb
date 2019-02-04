Rails.application.routes.draw do
  resources :answers
  resources :questions
  resources :teaching_sessions
  resources :course_members
  resources :courses
  devise_for :users, controllers:{
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
  scope '/users/:id' do
    get '/courses', action: :courses, controller: 'users/related'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#home"
end
