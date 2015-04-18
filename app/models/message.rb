# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  lecture_id :integer
#

class Message < ActiveRecord::Base
	belongs_to :lecture
	belongs_to :user
end
