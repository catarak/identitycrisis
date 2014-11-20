class Account < ActiveRecord::Base
  has_many :feeds
  has_one :master_twitter
  has_many :users, through: :group
  belongs_to :group
# link to twitter initializer profile


  def twitter_api
    @twitter_api ||= TwitterApi.new(self.access_token, self.access_token_secret)
  end

end
