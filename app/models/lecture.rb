# == Schema Information
#
# Table name: lectures
#
#  id         :integer          not null, primary key
#  day        :string
#  time       :time
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :integer
#

class Lecture < ActiveRecord::Base
	belongs_to :course
	has_many :messages

  def pretty_time
    return self.time.strftime("%I:%M %p")
  end

  def pretty_date
    return self.time.strftime("%A, %B %d, %Y")
  end

end
