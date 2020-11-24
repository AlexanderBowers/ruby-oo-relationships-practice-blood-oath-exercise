require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

f1 = Follower.new("billy", 15, "hello world")
f2 = Follower.new("Kyle", 24, "I like clouds")
f3 = Follower.new("Jimmy", 8, "What's Ruby?")

c1 = Cult.new("Blue", "Michigan", 2015, "cool beans")
c2 = Cult.new("Red", "Detroit", 2020, "We like turtles")
c3 = Cult.new("Green", "Michigan", 2015, "cool")

c1.recruit_follower(f1)
c1.recruit_follower(f2)
c2.recruit_follower(f3)
c2.recruit_follower(f2)
c2.recruit_follower(f1)


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits