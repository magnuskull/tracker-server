class TimelineEntry < ActiveRecord::Base

  belongs_to :timeline
  belongs_to :entry, polymorphic: true
  
  validates_presence_of :timeline

end
