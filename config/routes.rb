Rails.application.routes.draw do

  get 'end_users/my_page' => 'public/end_users#show'
  get 'end_users/information/edit' => 'public/end_users#edit'
  patch 'end_users/information' => 'public/end_users#update'
  get 'end_users/unsubscribe' => 'public/end_users#unsubscribe', as: 'unsubscribe'
  patch 'end_users/withdraw' => 'public/end_users#withdraw', as: 'withdraw'

  namespace :admin do
    root to: "homes#top"
  end
  root 'public/homes#top'
  get 'about' => 'public/homes#about'
  scope module: 'public' do
    resources :questions, only: [:new, :create, :index, :show]
  end
  namespace :public do

  end
  devise_for :end_users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
