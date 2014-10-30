class Task < ActiveRecord::Base
  belongs_to :project

  validates :title, presence: true
  belongs_to :user

  scope :recent, -> { order("updated_at DESC") }
end
