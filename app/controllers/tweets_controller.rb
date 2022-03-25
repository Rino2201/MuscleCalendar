class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @user = current_user
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end

  end

  def show
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
  end

  def index
    @tweets = Tweet.all
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweet_path(@tweet)
    else
      render :edit
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:user_id, :text, :image, :start_time)
  end

end
