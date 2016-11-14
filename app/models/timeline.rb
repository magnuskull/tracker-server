class Timeline < ActiveRecord::Base

  belongs_to :user
  has_many :timeline_entries

  validates_presence_of :name
  validates_presence_of :user

end
