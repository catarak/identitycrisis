class Group < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  has_many :accounts, dependent: :destroy

  accepts_nested_attributes_for :accounts, :reject_if => lambda{ |a| a[:name].blank? || a[:access_token].blank? || a[:access_token_secret].blank? }
  #accepts_nested_attributes_for :users

end
