class CommentsController < ApplicationController

  def create
    tweet = Tweet.find(params[:tweet_id])
    text = current_user.comments.new(comment_params)
    text.tweet_id = tweet.id
    text.save
    redirect_to tweet_path(tweet)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to tweet_path(params[:tweet_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

end
