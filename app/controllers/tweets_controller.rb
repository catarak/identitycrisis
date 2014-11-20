class TweetsController < ApplicationController

  def create
    @account = Account.find(params[:account_id])
    @account.twitter_api.update(params[:tweet])
    @tweet = params[:tweet]
  end

end
