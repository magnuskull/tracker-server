class Timeline < ActiveRecord::Base

  belongs_to :user
  has_many :timeline_entries, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :question
  validates_presence_of :user

end
