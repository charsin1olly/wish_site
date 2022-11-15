class WishListController < ApplicationController
  def new_wish
  end

  def card
  end

  def catch_wish
    # render html:params
    # list =params[:wish_list]
    # title = params[:title]
    # content = params[:content]

    clean_params = params.require(:wish).permit( :title , :description)
    wish = WishList.new(clean_params)
    
    # render html: clean_params

    if wish.save
      render html: "ok"
    else
      render html: "ng"
    end

  end

end
