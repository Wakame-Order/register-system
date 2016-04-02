class SessionController < ApplicationController

  before_action :prohibit_singined_in_user, only: [:index, :create]

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

  def prohibit_singined_in_user
    binding.pry
    if user_signed_in?
      redirect_to session[:past_url]
    else
      render :register
    end
  end
end
