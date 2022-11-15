Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
  get"/make_a_wish", to: "wish_list#card"
  get"/new_wish" , to: "wish_list#new_wish"
  post "/catch_wish" ,to: "wish_list#catch_wish"

  # get "/home", to: "pages#home"
  root"pages#home"
  
end


