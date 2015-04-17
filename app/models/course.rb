# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  lectures_id :integer
#

class Course < ActiveRecord::Base
	has_many :lectures

end
