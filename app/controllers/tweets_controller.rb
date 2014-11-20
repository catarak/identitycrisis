class TweetsController < ApplicationController
  def create
    Sams_twitter.update(params[:tweet])
    @tweet = params[:tweet]
  end
end
