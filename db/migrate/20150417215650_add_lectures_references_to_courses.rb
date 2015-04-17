class AddLecturesReferencesToCourses < ActiveRecord::Migration
  def change
    add_reference :courses, :lectures, index: true
    add_reference :lectures, :messages, index: true
    add_reference :users, :messages, index: true
  end
end
