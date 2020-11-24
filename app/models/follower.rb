class Follower

    @@all = []
    attr_accessor :name, :age, :life_motto

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def blood_oaths
        BloodOath.all.select {|bloodoath| bloodoath.follower == self}
    end

    def cults
        self.blood_oaths.select {|bloodoath| bloodoath.cult.followers.include?(self)}
    end

    def join_cult(cult)
        BloodOath.new(self, cult)
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        @@all.select {|follower| follower.age > age}
    end

    def my_cults_slogans
        self.cults.map {|bloodoath| bloodoath.cult.slogan}
    end

    def self.most_active
        @@all.max_by{|follower| follower.cults.count}
    end

    def fellow_cult_members
        fellow_members = []
        Cult.all.map do |cult|
            if cult.followers.include?(self) == true
                cult.followers.each {|follower| fellow_members << follower }
            end
        end
        fellow_members.uniq
    end




end