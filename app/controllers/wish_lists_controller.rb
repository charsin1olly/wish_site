class WishListsController < ApplicationController
before_action :authenticate_user! 
before_action :find_wish_list, only:[:show ,:edit ,:update ,:destroy]

  
  def index
    @wish_lists = current_user.wish_lists
  end
 
  def new
    @wish_list = WishList.new

   
  end

  def create
    # @wish_list = WishList.new(clean_wish_list)
    # @wish_list.user_id = current_user
    
    @wish_list = current_user.wish_lists.new(clean_wish_list)

    if @wish_list.save
      redirect_to root_path , notice: "許願成功～～"
    else
      render :new
    end
  end

  def show
    @comment=comment.new
    #把id 做反向排序
    @comments=@wish_list.comment.order(id: :desc)
  end

  def edit
    
  end

  def update
    if @wish_list.update(clean_wish_list)
      redirect_to root_path , notice: "修改成功～～"
    else
      render :edit
    end
  end

  def destroy
    # @wish_list.destroy
    redirect_to root_path ,notice:"刪除成功"
  end

private
  def find_wish_list
    @wish_list = current_user.wish_lists.find(params[:id])
    # @wish_list = current_user.wish_lists.find_by!(id: params[:id] , delete_time: nil)
  end

  def clean_wish_list
    params.require(:wish_list).permit( :title , :description)
  end

 

end
