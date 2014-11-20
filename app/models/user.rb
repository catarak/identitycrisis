class User < ActiveRecord::Base
  belongs_to :group
  has_one :personal_twitter_identity
  has_one :personal_git_identity
end
