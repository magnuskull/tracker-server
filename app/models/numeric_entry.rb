class NumericEntry < ActiveRecord::Base

  has_one :timeline_entry, as: :entry
  has_one :timeline, through: :timeline_entry

  validates_presence_of :value
  validates_numericality_of :value, greater_than_or_equal_to: 1, less_than_or_equal_to: 5

end
