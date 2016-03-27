class SessionsController < ApplicationController
  def create
    account = params[:account]
    password = params[:password]
    user = find_or_creare(account, password)
    session[:user_id] = user.id
    redirect_to 
  end
end

def find_or_creare(account, password)
  User.find_or_create_by(account: account, password: password ) do |user|
    user.account = account
    user.password = password
  end
end

def success_login?

end
