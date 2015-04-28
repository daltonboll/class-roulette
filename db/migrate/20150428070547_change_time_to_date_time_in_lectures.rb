class ChangeTimeToDateTimeInLectures < ActiveRecord::Migration
  def change
    remove_column :lectures, :time
    add_column :lectures, :time, :datetime
  end
end
