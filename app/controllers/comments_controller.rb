class CommentsController < ApplicationController
  before_action :authenticate_user! 
  before_action :find_comment, only:[:create ,:destroy]
  
  def create
    @comment=@wish_list.comments.new(comment_params)

    # @comment.user=current_user

    if @comment.save
        redirect_to wish_list_path(@wish_list),notice:"已留言"
      else
        redirect_to wish_list_path(@wish_list),alert:"請填寫留言"
      end
    
  end

  def destroy
    @comment.update(deleted_at: Time.current)
    redirect_to wish_list_path ,notice:"刪除成功"
  end

  private

  def find_comment
  @wish_list = current_user.wish_lists.find(params[:wish_list_id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
    # params.require(:comment).permit(:content)
  end

end
