class SessionsController < ApplicationController

  def login
    render :login
  end

  def main
    account = params[:account]
    password = params[:password]
    user = User.find_by account: accont, password: password
    puts user
    if !user
      flash_message = "ログインに失敗しました"
      redirect_to "/login", notice: flash_message
    end
    flash_message ="ログインしました"
    redirect_to "/me", notice: flash_message
  end

  def index

  end
  def create
    account = params[:account]
    password = params[:password]
    #ここですでに存在しているユーザかどうかチェック
    user = User.find_by account: account, password: password
    if user
      flash_message = "#{account}はすでに存在しています"
      redirect_to "/me", notice: flash_message
    end
  end
  private

  def fetch_date
    time_table = Scraper::TimeTableScraper.new
    time_table.fetch_time_table
    render text: 'hello'
  end
end

