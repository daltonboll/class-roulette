class Lecture < ActiveRecord::Base
	belongs_to :course

	has_many :messages

end
