SurveyProject::Application.routes.draw do

  resources :patients do 
    member do 
      get 'patient_note'
    end
  end

  resources :notes do
    resources :segments
  end

  resources :surveys do 
    member do 
      get 'take'
      post 'submit'
    end
    resources :questions
    resources :answers
  end

  resources :main
  resources :user_sessions
  resources :users

  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout

  root :to => 'main#index'

end
