class ChangeNullOfUserInTimeline < ActiveRecord::Migration
  def change
    change_column_null :timelines, :user_id, false
  end
end
