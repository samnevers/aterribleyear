# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :text
#  email           :text
#  password_digest :text
#  image           :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  bio             :text
#

class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :ratings
  has_many :comments

end
