class ReplyRelationship < ApplicationRecord
    belongs_to :main_tweet, class_name: "Tweet"
    belongs_to :reply_tweet, class_name: "Tweet"
end
