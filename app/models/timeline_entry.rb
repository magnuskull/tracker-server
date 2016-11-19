class TimelineEntry < ActiveRecord::Base

  belongs_to :timeline
  has_one :user, through: :timeline

  validates_presence_of :timeline

  validates_presence_of :value
  validates_numericality_of :value, greater_than_or_equal_to: 1, less_than_or_equal_to: 5

end
