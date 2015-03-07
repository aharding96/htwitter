class TweetsController < ApplicationController
	def new
		@tweet = Tweet.new
	end

	def create
		@tweet = Tweet.new(tweet_params)
		if @tweet.save
			flash[:success] = "You Tweeted!"
			redirect_to new_tweet_path
		end
	end

	def tweet_params
		params.require(:tweet).permit(:content)
	end

	def index
		@tweets = Tweet.all
	end
end
