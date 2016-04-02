class BaseController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_user
  before_action :past_url 

  protected 

  def user_signed_in?
    session[:user_id].present?
  end
  
  
  def registered_user?(account, password)
    user = User.find_by({account: account, password: password})
    if user.present?
      @user = user
    end
  end


  def user_session_id
    if user_signed_in? 
      session[:user_id]
    end
  end


  def set_user
    if user_signed_in? 
      @user = User.find(session[:user_id])
    end
  end


  def past_url
    if !session[:recent_url].present?
      session[:recent_url] = :login
    end
    if session[:recent_url].present? && session[:recent_url] != request.url
      session[:past_url] = session[:recent_url]
      session[:recent_url] = request.url
    end
  end

  def prohibit_singined_in_user
  end
end
