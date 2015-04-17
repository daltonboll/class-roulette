class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :day
      t.time :time

      t.timestamps null: false
    end
  end
end
