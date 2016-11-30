class AddTypeToTimelines < ActiveRecord::Migration
  def change
    add_column :timelines, :type, :integer, null: false, default: 0
  end
end
