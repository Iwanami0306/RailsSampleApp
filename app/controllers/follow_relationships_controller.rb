class FollowRelationshipsController < ApplicationController
    #フォロー関係の作成
    def create
        @user = User.find(params[:followed_id])
        current_user.follow(@user)
        flash[:success] = 'ユーザーをフォローしました'
        redirect_to request.referer
    end
    #フォロー関係の削除
    def destroy
        @user = FollowRelationship.find(params[:id]).followed
        current_user.unfollow(@user)
        flash[:success] = 'ユーザーのフォローを外しました'
        redirect_to request.referer
    end
end
