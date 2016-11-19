class AddQuestionToTimelines < ActiveRecord::Migration
  def up
    add_column :timelines, :question, :text, default: "What's the question?"
    change_column_null :timelines, :question, false
  end
  def down
    remove_column :timelines, :question, :text
  end
end
