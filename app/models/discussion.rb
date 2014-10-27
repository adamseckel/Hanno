class Discussion < ActiveRecord::Base
  belongs_to :project
  has_many :comments, dependent: :destroy

  validates :description, presence: true

  scope :recent, -> { order("updated_at DESC") }
end
