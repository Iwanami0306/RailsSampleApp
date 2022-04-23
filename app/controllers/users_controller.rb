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
end
