class StaticPagesController < ApplicationController
  def home
    if logged_in?
          @tweets = Tweet.all.order(created_at: "DESC")
          @new_tweet = current_user.tweets.new
    end
  end
end
