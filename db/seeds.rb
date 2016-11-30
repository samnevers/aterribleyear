# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


    # DUMMY USERS
User.destroy_all

u1 = User.create :username => "fancy", :email => "fancy@email.com", :password => "chicken", :password_confirmation => "chicken"

u2 = User.create :username => "rozilla", :email => "rozilla@email.com", :password => "chicken", :password_confirmation => "chicken"

u3 = User.create :username => "champman", :email => "champman@email.com", :password => "chicken", :password_confirmation => "chicken"

u4 = User.create :username => "samme", :email => "sam@email.com", :password => "chicken", :password_confirmation => "chicken"

puts "\tUser count: #{User.all.count}"


    # DUMMY POSTS
Post.destroy_all

p1 = Post.create :title => "Burn 2016 Burn!", :text => "Upvote if you wish we could erase 2016 from history!!", :date => "2016-01-01", :pinnedpost => true, :goodpost => false

p6 = Post.create :title => "Trump", :text => "The world is over. America, you suck. WHYYYYY!", :date => "2016-11-26", :goodpost => false

p2 = Post.create :title => "Found out Santa isn't real", :text => "WHY WOULD YOU LIE TO MEEEE. MY LIFE IS A LIEEEEE!!", :date => "2016-1-1", :goodpost => false

p3 = Post.create :title => "Badger made me present today", :text => "That was the worst.", :date => "2016-11-25", :goodpost => false

p4 = Post.create :title => "That earthquake", :text => "Terrible, terrible tragedy. Many lives lost. Very sad. T_T </3", :date => "2016-11-25", :goodpost => false

p5 = Post.create :title => "Broke my project", :text => "RIGHT BEFORE DEMO, I BROKE MY FUCKING PROJECT WHYYYYYYY", :date => "2016-11-11", :goodpost => false

puts "\tPost count: #{Post.all.count}"


    # DUMMY ASSOCIATIONS
      # USER HAS_MANY POST
      # POST BELONGS_TO USER
u1.posts << p2
u2.posts << p6 << p4
u3.posts << p3
u4.posts << p5 << p1

# Testing stuff

puts "Post Author: #{p1.user.username}"

    # DUMMY RATINGS

r1 = Rating.new
r1.user_id = u1.id
r1.post_id = p1.id
r1.save

    # DUMMY COMMENTS

c1 = Comment.new
c1.user_id = u1.id
c1.post_id = p1.id
c1.text = "blah blah blah"
c1.save
