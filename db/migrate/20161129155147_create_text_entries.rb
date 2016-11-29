class CreateTextEntries < ActiveRecord::Migration
  def change
    create_table :text_entries do |t|
      t.string :answer

      t.timestamps null: false
    end
  end
end
