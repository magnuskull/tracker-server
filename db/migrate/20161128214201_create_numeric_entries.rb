class CreateNumericEntries < ActiveRecord::Migration
  def change
    create_table :numeric_entries do |t|
      t.integer :value, null: false

      t.timestamps null: false
    end
  end
end
