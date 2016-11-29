class AddPolymorphicRelationToTimelineEntries < ActiveRecord::Migration
  def change
    add_reference :timeline_entries, :entry, polymorphic: true, index: true
  end
end
