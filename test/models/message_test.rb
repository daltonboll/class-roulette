# == Schema Information
#
# Table name: messages
#
#  id          :integer          not null, primary key
#  text        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  lectures_id :integer
#  users_id    :integer
#

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
