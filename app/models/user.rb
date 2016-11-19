class User < ActiveRecord::Base

  has_many :timelines, dependent: :destroy
  has_many :timeline_entries, through: :timelines

  validates_presence_of :username
  validates_uniqueness_of :username, case_sensitive: false

end
