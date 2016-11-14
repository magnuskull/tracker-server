class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
