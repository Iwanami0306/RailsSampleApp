class StaticPagesController < ApplicationController
  def home
    if logged_in?
          @new_tweet = current_user.tweets.new
          # ユーザとそのフォロー中のユーザのツイート(タイムラインのツイート)を表示
          following_ids = "SELECT followed_id FROM follow_relationships WHERE follower_id = :user_id"
          reply_ids = "SELECT reply_tweet_id FROM reply_relationships"
          @tweets=Tweet.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: current_user.id).where.not("id IN (#{reply_ids})").order(created_at: "DESC")
    end
  end
end
