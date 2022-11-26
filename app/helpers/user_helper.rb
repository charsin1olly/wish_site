module UserHelper
  def current_user
    #memorization 記憶手法，出現過的東西在這個頁面留下實體變數
  @login_username ||=User.find_by(id: session[:user])
  end

  # def user_sign_in?
  #   !!session[:user]
  # end
end
