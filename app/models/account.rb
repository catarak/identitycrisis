class Account < ActiveRecord::Base
  has_many :feeds
  has_one :master_twitter
  has_one :master_tumblr
  has_many :users, through: :group
  belongs_to :group

end
