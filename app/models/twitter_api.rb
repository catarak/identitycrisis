class TwitterApi
  attr_accessor :client, :stream

  def initialize(application_token, application_token_secret, access_token, access_token_secret)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = application_token
      config.consumer_secret     = application_token_secret
      config.access_token        = access_token
      config.access_token_secret = access_token_secret
    end

    @stream = Twitter::Streaming::Client.new do |config|
      config.consumer_key        = application_token
      config.consumer_secret     = application_token_secret
      config.access_token        = access_token
      config.access_token_secret = access_token_secret
    end
  end

  def update(tweet)
    client.update(tweet)
  end

  def grab_10_most_recent(username)
    client.user_timeline(username).take(10)
  end
end
