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
#  goodpost   :boolean
#

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :ratings
  has_many :comments
end
