class TweetsController < ApplicationController
    def create
        if current_user
            current_user.tweets.create(content:tweet_params["content"])
            redirect_to request.referer
        end
    end

    def destroy
        if (tweet=Tweet.find(params["id"].to_i)) && (current_user.id == tweet.user_id)
            tweet.destroy
            flash[:success] = 'ツイートを削除しました'
        else
            flash[:danger] = 'ツイートの削除に失敗しました'
        end
        redirect_to request.referer
    end

    private

    def tweet_params
        params.require(:tweet).permit(:content,:user_id,:id)
    end
end
