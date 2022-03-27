Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  #devise_for :users, controllers: {
    #registrations: 'users/registrations',
    #sessions: 'users/sessions'
  #}
  devise_scope :user do
    get 'users/index', to: 'users/registrations#index'
    get 'users/destroy', to: 'users/sessions#destroy'
  end
  #homesコントローラ
  root :to =>"homes#top", as: "root"
  get "home/about"=>"homes#about"
  #get "home/info/" =>"homes#info"
  resources :infos

  #usersコントローラ
  get 'users/show'
  get "users/unsubscribe" => "users#unsubscribe", as: "unsubscribe"
  patch "users/withdraw" => "users#withdraw", as: "withdraw"
  #上の2行は下のresourcesより上に記述する必要がある
  get 'users/my_page' => 'users#show'
  # resources :users, only: [:edit, :update]
  get 'users/edit' => 'users#edit'
  patch 'users/update'

  # 検索機能
  get "search/search" => "searches#search"
  resources :items, only: [:new,:index,:show,:edit,:create,:destroy,:update]do
    resource :favorites, only: [:create, :destroy]
  end
    #favoritesはresourceにsがつかない
    #ordersコントローラ
  post "orders/check" => "orders#check", as: "check"
  post "orders/new" => "orders#new"
  get "orders/confirm_wrapping" => "orders#confirm_wrapping", as: "confirm_wrapping"
  get "orders/complete" => "orders#complete", as: "complete"
  resources :orders, only: [:new, :create, :index, :show]

  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'

  get 'events/index'
  resources :events, only: [:new, :index, :create, :show, :edit, :destroy, :update]


  devise_for :users,skip: [:passwords], controllers: {
    registrations: "users/registrations",
    sessions: 'users/sessions'
  }
end
  #ここから下bookers2の参考資料
# devise_for :users
#  root :to =>"homes#top"
#   get "home/about"=>"homes#about"
#   # 検索機能
#   get "search/search" => "searches#search"
#   # get "search/search" => "searches#search"
#   # フォロー機能追記do end 他OR users do からendend
#   resources :users, only: [:index,:show,:edit,:update]do
#     resource :relationships, only: [:create,:destroy,:following, :followers]
#     get "relationship/following" => "relationships#following"
#     get "relationship/followed" => "relationships#followed"
#   end
#   # favoriteはresourseにSがつかない
#   resources :books, only: [:new,:index,:show,:edit,:create,:destroy,:update]do
#     resource :favorites, only: [:create, :destroy]
#     resources :book_comments, only: [:create, :destroy]
#   end
#   devise_for :users,skip: [:passwords], controllers: {
#     registrations: "public/registrations",
#     sessions: 'public/sessions'
#   }



#ここから下チーム開発の参考資料
# scope module: :public do
#     get 'users/edit' => 'users#edit', as: 'user_edit'
#   end

#   devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
#     sessions: "admin/sessions"
#   }
#   scope module: :public do
#     #homesコントローラ
#     root to: "homes#top", as: "root"
#     get "about"=>"homes#about", as: "about"
#     #costomersコントローラ
#     get "users/unsubscribe" => "users#unsubscribe", as: "unsubscribe"
#     patch "users/withdraw" => "users#withdraw", as: "withdraw"
#     #上の2行は下のresourcesより上に記述する必要がある
#     get 'users/my_page' => 'users#show'
#     patch 'users' => 'users#update'
#     #ordersコントローラ
#     post "orders/comfirm" => "orders#confirm", as: "confirm"
#     get "orders/complete" => "orders#complete", as: "complete"
#     resources :orders, only: [:new,:create,:index,:show]
#     #shippingsコントローラ
#     resources :shippings, only: [:index,:create,:edit,:update,:destroy]
#     #genresコントローラ
#     #resources :genres, only: [:show]
#     #itemsコントローラ
#     resources :items, only: [:index,:show]
#     #cart_itemsコントローラ
#     #delete "cart_items/destroy_all" => "cart_items#destroy_all",as: "destroy_all"
#     #resources :cart_items, only: [:index,:create,:update,:destroy]
#   end
  # end
#     devise_for :users,skip: [:passwords], controllers: {
#     registrations: "public/registrations",
#     sessions: 'public/sessions'
#   }
