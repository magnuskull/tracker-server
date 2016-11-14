class AddUserToTimeline < ActiveRecord::Migration
  def change
    add_reference :timelines, :user, index: true, foreign_key: true
  end
end
