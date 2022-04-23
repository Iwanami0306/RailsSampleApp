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

    def show
        @tweet = Tweet.find_by(id:params["id"])
        if(!@tweet)
            redirect_to root_url
        end
        @replies =  @tweet.reply_tweets.order(created_at: "DESC")
        #リプライ元のツイートを遡っていく
        main_tweet=@tweet.main_tweet
        @main_tweets=[]
        while main_tweet do
            @main_tweets.push(main_tweet)
            main_tweet = main_tweet.main_tweet
        end
    end

    # リプライを投稿する
    def reply
        if(logged_in?)
            @tweet = Tweet.find_by(id:params[:main_tweet_id])
            p params
            reply_tweet=current_user.tweets.create(content: tweet_params[:content])
            if(reply_tweet.valid? && @tweet)
                flash[:success] = 'リプライを投稿しました'
                @tweet.passive_reply_relationships.create(reply_tweet_id: reply_tweet.id)
            else
                flash[:danger] = 'リプライに失敗しました'
            end
            redirect_to request.referer
        end
    end

    private

    def tweet_params
        params.require(:tweet).permit(:content,:user_id,:id)
    end
end
