class TwitterApi
  def initialize(access_token, access_secret)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_KEY"]
      config.consumer_secret     = ENV["TWITTER_SECRET"]
      config.access_token        = access_token
      config.access_token_secret = access_secret
    end
  end

  def update(tweet)
    @client.update(tweet)
  end

end