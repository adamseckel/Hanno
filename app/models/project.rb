class Project < ActiveRecord::Base

  has_many :tasks, dependent: :destroy
  has_many :discussions, dependent: :destroy

  has_many :comments, through: :discussions
  has_many :favourites, dependent: :destroy

  belongs_to :user
  
  scope :recent, -> { order("updated_at DESC") }

  def favourite_for (user)
    favourites.find_by_user_id user
  end

end
