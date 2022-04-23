class UsersController < ApplicationController
  def show
    @user = User.find_by(nickname: params[:nickname])
    if(@user)
        @tweets = @user.tweets.order(created_at: "DESC")
    else
        redirect_to request.referer
    end
  end

  def index
    @users = User.all
  end
  
  #フォロワーを表示
  def show_followers
    @user = User.find_by(nickname: params[:nickname])
    if(@user)
        @followers = @user.followers.order(created_at: "DESC")
    else
        flash[:danger] = 'ユーザーが存在しません'
        redirect_to request.referer
    end
  end

  #フォロー中のユーザを表示
  def show_followings
      @user = User.find_by(nickname: params[:nickname])
      if(@user)
          @followings = @user.followings.order(created_at: "DESC")
      else
          flash[:danger] = 'ユーザーが存在しません'
          redirect_to request.referer
      end
  end
end