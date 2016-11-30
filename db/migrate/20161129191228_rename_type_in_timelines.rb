class RenameTypeInTimelines < ActiveRecord::Migration
  def change
    rename_column :timelines, :type, :timeline_type
  end
end
