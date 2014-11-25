class AccountsController < ApplicationController
  protect_from_forgery

#   def load_tweets
# # @client = client.new
#     # client = Twitter::Client.new
#     $tweets.user_timeline('runsammrun', [0..4])
#     # @tweets = Twitter.user_timeline[0..4]
#     # @tweets = Twitter.user_timeline[0..4]
#     #max of 5
#   end

    # @recent_tweets = TwitterApi.new(@account.access_token, @account.access_token_secret).grab_10_most_recent(@account.name)


  def show
    @account = Account.find(params[:id])
    @tweets = TwitterApi.new(@account.access_token, @account.access_token_secret).user_timeline[0..4]
    # @client = client.new
    # client = Twitter::Client.new
  end

  def new
    @account = Account.new
    @group = Group.find(params[:group_id])
    #run js to render new account form
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      render 'create'
    else
      render json: {error: "Your account failed to save"}, status: 400
    end
  end



  private
  def account_params
    params.require(:account).permit(:name, :access_token, :access_token_secret, :group_id)
  end
end

