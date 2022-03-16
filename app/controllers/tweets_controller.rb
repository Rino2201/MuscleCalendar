class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new
    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end

  end

  def show
    @tweet = Tweet.find(params[:id])
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

  end

  private

  def tweet_params
    params.require(:tweet).permit(:user_id, :training_id, :title, :text, :image_id, :start_time)
  end

end
