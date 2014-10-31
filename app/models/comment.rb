class Comment < ActiveRecord::Base
  belongs_to :discussion
  belongs_to :user
  
  validates :body, presence: true

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  def like_for (user)
    likes.find_by_user_id user
  end

  
end
