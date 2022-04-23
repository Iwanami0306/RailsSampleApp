class Tweet < ApplicationRecord
    belongs_to:user
    validates :user_id, presence: true
    validates :content, presence: true, length: {maximum:140}
    has_one :active_reply_relationship, class_name:  "ReplyRelationship", foreign_key: "reply_tweet_id", dependent:   :destroy
    has_one :main_tweet, through: :active_reply_relationship, source: :main_tweet
    has_many :passive_reply_relationships, class_name:  "ReplyRelationship", foreign_key: "main_tweet_id", dependent:   :destroy
    has_many :reply_tweets, through: :passive_reply_relationships, source: :reply_tweet

end
