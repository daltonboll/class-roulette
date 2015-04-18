class FixReferenceAssociations < ActiveRecord::Migration
  def change
    # add_reference :child, :parent, index: true

    # users, lectures, and courses should be singular, not plural
    remove_reference :messages, :users, index: true
    remove_reference :messages, :lectures, index:true
    remove_reference :lectures, :courses, index:true

    add_reference :messages, :user, index: true
    add_reference :messages, :lecture, index:true
    add_reference :lectures, :course, index:true
  end
end
