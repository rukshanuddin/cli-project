require_relative '../config/environment'

class Pokemon                                               #Define Pokemon class

    attr_accessor :name, :url
    attr_reader :info
    @@all = []
    def initialize(name, url)
        @name = name
        @url = url
        @@all << self 
    end


    def self.all
        @@all
    end

    def self.clear
        @@all.clear
    end
end

