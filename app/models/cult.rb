require 'pry'
class Cult
    @@all = []
    attr_reader :name, :location, :founding_year, :slogan
    attr_accessor :minimum_age

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
        minimum_age = 0
        @minimum_age = minimum_age
    end

    def bloodoaths
        BloodOath.all.select {|bloodoath| bloodoath.cult == self}
    end


    def recruit_follower(follower)
      follower.age >= self.minimum_age ? BloodOath.new(follower, self) : "Sorry, you are not old enough to join this cult."
    end

    def followers
        self.bloodoaths.map {|bloodoath| bloodoath.follower}
    end

    def cult_population
        self.bloodoaths.map{ |bloodoath| bloodoath.follower}.length
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        @@all.find {|cult| cult.name == name}
    end

    def self.find_by_location(location)
        @@all.find {|cult| cult.location == location}
    end

    def self.find_by_founding_year(year)
        @@all.collect{|cult| cult.founding_year == year}
    end

    def average_age
        self.followers.sum {|follower| follower.age / self.followers.length}
    end

    def my_followers_mottos
        self.followers.map {|follower| follower.life_motto}
    end

    def self.least_popular
    @@all.min_by{|cult| cult.cult_population}
    end

    def self.most_common_location
       locations = {}
        @@all.map do |cult|
            if locations.include?(cult.location)
                # binding.pry
                locations[cult.location] += 1
            else
                locations[cult.location] = 1
            end
        end
        locations.max_by {|location, cults| cults}.first
    end

end
