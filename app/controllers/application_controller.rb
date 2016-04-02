class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def signed_in_user?
    @user.present?
  end
  
  def registered_user?(account, password)
   @user = User.find_by(account, password)
  end
end
