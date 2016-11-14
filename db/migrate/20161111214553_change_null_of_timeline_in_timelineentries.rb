class ChangeNullOfTimelineInTimelineentries < ActiveRecord::Migration
  def change
    change_column_null :timeline_entries, :timeline_id, false
  end
end
