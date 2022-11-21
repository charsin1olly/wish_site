Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"

  resources :wish_lists do
    #新增時需要wishlist的ID
    #寄生在wish_list 不用index 不用show/不要編輯功能  shallow: true打開就有這種功能
    resources :comments , shallow: true ,only: [:create , :destroy]
    # resources :comments ,only: [:new, :create ,:index]
  end

  #新增時不需wishlist的ID
  # resources :comments ,only: [:show, :edit ,destroy]


  resource :user, as: "users" do
    collection do
      get :login
    end
  end
  
  resource :session , only: [:create , :destroy]
  # get "/make_a_wish", to: "wish_list#card"
  # get "/new_wish" , to: "wish_list#new"
  # post "/catch_wish", to: "wish_list#create"
  # get "/wish_card_info/:id", to: "wish_list#show", as: "wish_card_info"
  # get "/wish_card_info/:id/edit", to: "wish_list#edit", as: "edit_wish_card_info"
  # patch "/update_catch_wish/:id/update", to: "wish_list#update", as: "update_wish_card_info"
  
  # delete "/wish_card_info/:id", to: "wish_list#delete", as: "delete_wish_card_info"

  root "wish_lists#index"
end
