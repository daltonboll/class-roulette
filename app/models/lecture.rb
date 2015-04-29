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
  validates :day, presence: true
  validates :time, presence: true

  def pretty_time
    return self.time.strftime("%I:%M %p") # hour:minute AM/PM
  end

  def pretty_date
    return self.time.strftime("%A, %B #{self.time.day.ordinalize}, %Y") # Weekday, Month Day, Year
  end

  def simple_date
    return self.time.strftime("%b %d, %Y")
  end

  def weekday
    return self.time.strftime("%A")
  end

  def month
    return self.time.strftime("%B")
  end

  def day_as_number
    return self.time.strftime("%d")
  end

  def year
    return self.time.strftime("%Y")
  end

end
