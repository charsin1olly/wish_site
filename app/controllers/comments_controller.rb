class CommentsController < ApplicationController
  before_action :authenticate_user! 
  before_action :find_wish_list, only:[:create]
  
  def create
    @comment=@wish_list.comments.new(comment_params)
    @comment.user=current_user

    if @comment.save
      redirect_to wish_list_path(@wish_list),notice:"已留言"
      else
        render "wish_lists/show",notice:"請填寫留言"
      end
    
  end

  private

  def find_wish_list
  @wish_list = current_user.wish_list.find(params[:wish_list_id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(:current_user)
  end

end
