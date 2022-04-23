class User < ApplicationRecord
    has_many :tweets
    has_many :active_relationships, class_name: "FollowRelationship", foreign_key: "follower_id", dependent:   :destroy
    has_many :followings, through: :active_relationships, source: :followed
    has_many :passive_relationships, class_name:  "FollowRelationship", foreign_key: "followed_id", dependent:   :destroy
    has_many :followers, through: :passive_relationships, source: :follower
    # ユーザーをフォローする
    def follow(other_user)
        unless self == other_user
            self.active_relationships.find_or_create_by(followed_id: other_user.id)
        end
    end

    # ユーザーをフォロー解除する
    def unfollow(other_user)
        relationship = self.active_relationships.find_by(followed_id: other_user.id)
        relationship.destroy if relationship
    end

    # 現在のユーザーがフォローしてたらtrueを返す
    def following?(other_user)
        self.followings.include?(other_user)
    end
end
