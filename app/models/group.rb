class Group < ActiveRecord::Base
  has_many :users
  has_many :accounts
  has_many

end
