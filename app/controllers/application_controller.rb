class ApplicationController < ActionController::Base
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  # include UserHelper
  helper_method :current_user , :user_sign_in?
  #寫在controller給helper還可以用這個方法

  private
  def record_not_found
    # render html: "找不到"
    render file: "#{Rails.root}/public/404.html", status: 404,layout: false
  end

  def current_user
    #memorization 記憶手法，出現過的東西在這個頁面留下實體變數
    @login_username ||=User.find_by(id: session[:user])
  end

  def user_sign_in?
    !!session[:user]
  end

  def authenticate_user!
    if not user_sign_in?
    redirect_to login_users_path ,alert:"請先登入帳號"
    end
  end
  
end
