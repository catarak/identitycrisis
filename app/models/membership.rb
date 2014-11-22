class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  enum role: [:regular, :admin]
end
