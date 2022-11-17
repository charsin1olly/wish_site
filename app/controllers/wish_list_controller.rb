class WishListController < ApplicationController
  
rescue_from ActiveRecord::RecordNotFound, with: :not_found
  
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
    
    @wish_list = WishList.find(id: params[:id])
    render html: @wish_list.title

  end

private

def not_found
  # render html: "找不到"
  render profile: 404.html , status: 404
end

end
