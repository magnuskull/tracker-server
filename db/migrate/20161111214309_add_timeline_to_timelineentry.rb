class AddTimelineToTimelineentry < ActiveRecord::Migration
  def change
    add_reference :timeline_entries, :timeline, index: true, foreign_key: true
  end
end
