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

require 'test_helper'

class LectureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
