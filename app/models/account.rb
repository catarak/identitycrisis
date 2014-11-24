class Account < ActiveRecord::Base
  #has_many :feeds #this association ain't quite right but let's not worry abt it rn
  belongs_to :group
  #I'm not sure this users association is gonna work
  #has_many :users, through: :group


  def twitter_api
    @twitter_api ||= TwitterApi.new(self.access_token, self.access_token_secret)
  end

  def show
    #add a before filter to check if user is priviledged
  end
end
