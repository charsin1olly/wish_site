Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"

  get "/make_a_wish", to: "wish_list#card"
  get "/new_wish" , to: "wish_list#new_wish"
  post "/catch_wish", to: "wish_list#create_wish"
  get "/wish_card_info/:id", to: "wish_list#show_wish", as: "wish_card_info"
  get "/wish_card_info/:id/edit", to: "wish_list#edit_wish", as: "edit_wish_card_info"
  patch "/update_catch_wish/:id/update", to: "wish_list#update_wish", as: "update_wish_card_info"


  root"wish_list#card"
end
