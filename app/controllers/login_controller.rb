class LoginController < ApplicationController


  #TODO ログインメインロジック
  def login
    if user_signed_in? 
      #TODO top　ページの戻る仕組み
    else
      #TODO loginページへの遷移を促す
    end
    if registered_user?(user_params)
      #userがログインしているかは
      user_session(set_user(user_params))
    end
  end

  def logout
    if user_signed_in?
      session.delete(:user_id)
    end
  end

  private 
  # Never trust parameters from the scary internet, only allow the white list through.
  def set_user account, password
    user = User.find_by(:account, :password)
  end

  def user_params
    params.require(:session).permit(:account, :password)
  end

end
