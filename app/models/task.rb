class Task < ActiveRecord::Base
  belongs_to :project

  validates :title, presence: true

  scope :recent, -> { order("updated_at DESC") }
end
