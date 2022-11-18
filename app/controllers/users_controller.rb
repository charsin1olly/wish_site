class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def create
    # email = params[:email]
    # password = params[:password]
    # user = User.login(email, password)
    @user = User.new(clean_user_params)
    if user.save
      session[:user] = user.id
      redirect_to root_path, notice: "註冊成功"
    else
      # redirect_to login_users_path, alert: "登入失敗"
      render :new
    end
  end

  # def self.login(email, password)
  #   hashed_password = Digest::SHA1.hexdigest("keke#{password.reverse}haha")

  #   find_by(email: email , password: hashed_password)
  # end

  def login
  end




private
def clean_user_params
  params.require(:user).permit(:nickname , :email , :password , :password_confirmation)
end




end
