class BloodOath
    @@all = []

    attr_reader :cult, :follower, :initiation_date

    def initialize(follower, cult)
        @follower = follower
        @cult = cult
        initiate_date = Time.now
        @initiation_date = initiation_date
        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        @@all[0].follower
    end

end