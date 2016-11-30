class ChangeNullOfEntryIdAndTypeInTimelineEntries < ActiveRecord::Migration
  def change
    change_column_null :timeline_entries, :entry_id, false
    change_column_null :timeline_entries, :entry_type, false
  end
end
