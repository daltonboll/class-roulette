# == Schema Information
#
# Table name: lectures
#
#  id          :integer          not null, primary key
#  day         :string
#  time        :time
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  messages_id :integer
#

class Lecture < ActiveRecord::Base
	belongs_to :course

	has_many :messages

end
