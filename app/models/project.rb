class Project < ActiveRecord::Base
  scope :recent, -> { order("updated_at DESC") }
end
