class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def create
    @user = User.new(clean_user_params)
    if @user.save
      redirect_to root_path, notice: "註冊成功"
    else
      render :new
    end
  end

  def login
  end

private
  def clean_user_params
    params.require(:user).permit(:nickname , :email , :password , :password_confirmation)
  end




end
