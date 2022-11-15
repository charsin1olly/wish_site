Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"

  get "/make_a_wish", to: "wish_list#card"
  get "/new_wish" , to: "wish_list#new_wish"
  post "/catch_wish", to: "wish_list#create_wish"
  get "/wish_card_info:/id", to: "wish_card_info#show_wish", as: "wish_card_info"
  # get "/home", to: "pages#home"
  root"wish_list#card"
end
