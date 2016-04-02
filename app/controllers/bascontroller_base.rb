class BaseController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def signed_in_user?
    @user.present?
  end
  
  def registered_user?(account, password)
    User.find_by(account, password).present?
  end
end
