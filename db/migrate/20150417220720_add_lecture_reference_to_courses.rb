class AddLectureReferenceToCourses < ActiveRecord::Migration
  def change
    # add_reference :child, :parent, index: true
    add_reference :lectures, :courses, index: true
  end
end
