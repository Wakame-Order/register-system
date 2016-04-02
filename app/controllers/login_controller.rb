class LoginController < ApplicationController

  before_action :prohibit_singined_in_user, only: [:index, :login]
  def index
    render :login
  end

  def login
    login_params = user_params
    if registered_user?(login_params[:account], login_params[:password])
      session[:user_id] = @user.id
      redirect_to :me 
    end
  end

  def logout
    if user_signed_in?
      session.delete(:user_id)
    end
    redirect_to :login
  end

  private 

  def user_params
    params.require(:login).permit(:account, :password)
  end

  def prohibit_singined_in_user
    if user_signed_in?
      redirect_to session[:past_url]
    else
      render :login
    end
  end
end
