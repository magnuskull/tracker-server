class TextEntry < ActiveRecord::Base
  has_one :timeline_entry, as: :entry
  has_one :timeline, through: :timeline_entry
end
