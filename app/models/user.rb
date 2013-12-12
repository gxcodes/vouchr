class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

          validates :username, presence: true, uniqueness: { cas_sensitive: false }, length: { in: 6..20 }

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if username = conditions.delete(:username)
      where(conditions).where(["LOWER(username) = LOWER(:value)", { :value => username }]).first
    else
      where(conditions).first
    end
  end
  
end
