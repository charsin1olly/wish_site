class CommentsController < ApplicationController
  before_action :authenticate_user! 
  before_action :find_wish_list, only: [:create]
  before_action :find_comment, only: [:destroy]
  
  def create
    @comment=@wish_list.comments.new(comment_params)

    if @comment.save
        # redirect_to wish_list_path(@wish_list),notice:"已留言"
      else
        redirect_to wish_list_path(@wish_list),alert:"請填寫留言"
      end
    
  end

  def destroy
    @comment.destroy
    # @comment.update(deleted_at: Time.current)
    # redirect_to wish_list_path(@comment.wish_list) ,notice:"刪除成功"
  end

  private

  def find_comment
    @comment = current_user.comments.find(params[:id])
  end

  def find_wish_list
    @wish_list = current_user.wish_lists.find(params[:wish_list_id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
    # params.require(:comment).permit(:content)
  end

end
