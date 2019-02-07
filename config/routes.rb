# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/api' do
    resources :answers
    resources :questions
    resources :teaching_sessions
    resources :course_members
    resources :courses

    devise_for :users,
               path: '',
               path_names: {
                   sign_in: 'login',
                   sign_out: 'logout',
                   registration: 'signup'
               },
               controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations',
                 passwords: 'users/passwords'
               }

    scope '/users/:id' do
      get '/courses', action: :courses, controller: 'users/related'
    end

    scope '/users/:id' do
      get '/courses', action: :courses, controller: 'users/related'
    end
  end
end
