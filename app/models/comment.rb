class Comment < ActiveRecord::Base
  belongs_to :discussion
  validates :body, presence: true

  belongs_to :user
end
