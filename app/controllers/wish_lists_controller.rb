class WishListsController < ApplicationController
before_action :authenticate_user! 
before_action :find_wish_list, only:[:show ,:edit ,:update ,:destroy,:like]

  
  def index
    # @wish_lists = current_user.wish_lists
    #過濾有寫刪除時間的
    @wish_lists = current_user.wish_lists.where(deleted_at: nil)

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
    @comment=Comment.new
    #把id 做反向(id 升序 ASC；降序 DESC)排序(order)
    @comments=@wish_list.comments.order(id: :desc)
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
    @wish_list.update(deleted_at: Time.current)

    redirect_to root_path ,notice:"刪除成功"
  end

  def like
    if @wish_list.liked_by?(current_user)
      # 移除 like
      current_user.liked_wish_lists.delete(@wish_list)
      render json: { status: 'unliked' }
    else
      # 新增 like
      current_user.liked_wish_lists << @wish_list
      render json: { status: 'liked' }
    end
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
