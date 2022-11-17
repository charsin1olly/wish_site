class WishListController < ApplicationController
  

  
  def card
    @wish_lists = WishList.all
  end
 
  def new_wish
    @wish_list = WishList.new
  end

  def create_wish
    clean_params = params.require(:wish_list).permit( :title , :description)
    @wish_list = WishList.new(clean_params)
    

    if @wish_list.save
      redirect_to make_a_wish_path , notice: "許願成功～～"
    else
      render :new_wish
    end
  end

  def show_wish
    @wish_list = WishList.find(params[:id])

  end

  def edit_wish
    @wish_list = WishList.find(params[:id])
  end

  def update_wish
    @wish_list = WishList.find(params[:id])
    clean_params = params.require(:wish_list).permit( :title , :description)
    

    if @wish_list.update(clean_params)
      redirect_to root_path , notice: "修改成功～～"
    else
      render :edit_wish
    end
  end


end
