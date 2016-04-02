class BaseController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def user_signed_in?
    session[:user_id].present?
  end
  
  
  def registered_user?(account, password)
    User.find_by(account, password).present?
  end

  def user_session(user)
    session[:user_id] = user.id
  end

  def get_user_id
    if !session[:user_id].present?
      session[:user_id]
    end
  end
end
