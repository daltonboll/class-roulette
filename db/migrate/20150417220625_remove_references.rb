class RemoveReferences < ActiveRecord::Migration
  def change
    remove_reference :courses, :lectures, index: true
    remove_reference :lectures, :messages, index: true
    remove_reference :users, :messages, index: true
  end
end
