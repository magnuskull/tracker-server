class Timeline < ActiveRecord::Base

  enum timeline_type: [:Numeric, :Text]

  belongs_to :user
  has_many :timeline_entries, dependent: :destroy
  has_many :numeric_entries, through: :timeline_entries, source: :entry, source_type: 'NumericEntry'
  has_many :text_entries, through: :timeline_entries, source: :entry, source_type: 'TextEntry'

  validates_presence_of :name
  validates_presence_of :question
  validates_presence_of :user
  validates_presence_of :timeline_type

end
