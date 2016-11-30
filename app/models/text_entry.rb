class TextEntry < ActiveRecord::Base
  has_one :timeline_entry, as: :entry, dependent: :destroy
  has_one :timeline, through: :timeline_entry
end
