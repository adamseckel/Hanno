class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :projects
  has_many :tasks
  has_many :discussions
  has_many :comments

  def email_required?
    provider.nil?
  end

  def self.find_or_create_from_github(oauth_data)
    # binding.pry
    user = User.where(provider: :github, 
                      uid: oauth_data["uid"]).first

    unless user.present?
      name = oauth_data["info"]["name"].split
      user = User.create!(first_name: name[0],
                          last_name: name[1],
                          email: oauth_data["info"]["email"],
                          password: Devise.friendly_token,
                          provider: :github,
                          uid: oauth_data["uid"]
                          # raw_oauth_info: oauth_data
                          )
    end
    user
  end

  def full_name
    if first_name || last_name
      "#{first_name.try(:capitalize)} #{last_name.try(:capitalize)}".strip.squeeze(" ")
    else
      email
    end
  end
end
