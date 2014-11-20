class Feed < ActiveRecord::Base
  has_many :keywords
  belongs_to :account

end
