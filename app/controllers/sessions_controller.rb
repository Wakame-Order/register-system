class SessionsController < ApplicationController
  def create
    account = params[:account]
    password = params[:password]
    user = find_or_creare(account, password)
    session[:user_id] = user.id
    redirect_to 
  end

  def find_or_creare(account, password)
    User.find_or_create_by(account: account, password: password ) do |user|
      user.account = account
      user.password = password
    end
  end

  def fetch_date
    Scraper::BasicScraper::url
    render text: 'hello'
  end
end

