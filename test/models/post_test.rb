# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :text
#  text       :text
#  image      :text
#  user_id    :integer
#  date       :date
#  type       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pinnedpost :boolean
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
