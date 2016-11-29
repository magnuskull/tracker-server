class RemoveValueFromTimelineEntries < ActiveRecord::Migration
  def change
    remove_column :timeline_entries, :value, null: false
  end
end
