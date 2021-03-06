Rails.application.routes.draw do
  devise_for :users

  # 管理员路由
  namespace :admin do
    resources :questions do
      resources :answers
    end
    resources :conversations
    resources :users do
      member do
        post :change_to_user
        post :change_to_lawyer
      end
    end
  end

  # 普通用户路由
  namespace :account do
    resources :documents
    resources :users
    resources :questions do
      resources :answers
      resources :conversations

    end

  end

  # 律师路由
  namespace :lawyer do
    resources :users
    resources :questions do
 
        resources :answers
    end
    resources :documents do
      resources :feedbacks
    end

  end



  resources :welcome
  root 'welcome#index'

end
