class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :memberships
  has_many :groups, through: :memberships

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth ['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['name'] || ""
      end
    end
  end

end
