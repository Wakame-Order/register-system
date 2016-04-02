class SessionController < ApplicationController

  def login
    # if signed_in?
    #   redirect_to "/me"
    # else
    #   render :login
    # end
    # ログインした時に時間割のテーブルを取得してくる
    render :login
  end

  def main
    @user = User.find_by session_params
    if !@user.present?
      flash_message = "ログインに失敗しました"
      puts '//////////////////////////'
      redirect_to "/login", notice: flash_message
      return
    end
    session[:user_id] = @user.id
    flash_message ="すでにログインしています"
    redirect_to "/me", notice: flash_message
  end

  def index
    render :register
  end

  def create
    account = params[:account]
    password = params[:password]
    #ここですでに存在しているユーザかどうかチェック
    @user = User.find_by account: account, password: password
    if @user.present?
      flash_message = "#{account}はすでに存在しています"
      redirect_to "/me", notice: flash_message
      return
    end
   @user = User.create session_params
   if @user.present?
     profile = Profile.create(user_profile_params)
     if profile.present?
       @user.profile = profile
       #TODO ここではerrorを引き起こさずにvalidアカウントかどうかを確かめたい
       time_table = fetch_data
       if !time_table.present?
         time_table ={error: "あなたの時間割には何も登録されていません"}
       end
       render json:  time_table
     end
   end
  end

  private

  def fetch_data
    time_table = Scraper::TimeTableScraper.new(session_params)
    time_table.fetch_time_table
  end

  def session_params
    params.require(:session).permit(:account, :password)
  end

  def user_profile_params
    params.require(:session).permit(:gender, :grade)
  end
end
