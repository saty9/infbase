# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/api' do
    resources :answers
    resources :questions
    resources :teaching_sessions, only: [:index, :show]
    resources :course_members
    resources :courses, only: [:index, :show]
    resources :hours, only: [:index]

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

    namespace 'users' do
      get ':id/courses', controller: 'related', action: :courses
    end

    namespace 'admin' do
      resources :users, only: [:index, :update]
      resources :hours, only: [:index, :create, :update, :destroy]
      resources :teaching_sessions, only: [:create, :update, :destroy]
      resources :expertise, only: [:index, :create, :destroy]
      resources :courses, only: [:create, :update, :destroy]
    end
  end
end
