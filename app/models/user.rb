class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
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

  def name
    [first_name, last_name].compact.join(' ') if first_name && last_name
  end

  def admin?(group)
    self.memberships.find_by(group_id: group.id).admin?
  end

  def identifier
    self.name || self.email
  end

  def pending?
    self.sign_in_count == 0
  end
end
