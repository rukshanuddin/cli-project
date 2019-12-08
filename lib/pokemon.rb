require_relative '../config/environment'

class Pokemon                                               #Define Pokemon class

    attr_accessor :name, :url
    attr_reader :info, :number
    @@all = []
    @@all_names = []
    def initialize(name, url)
        @name = name
        @url = url
        @number = number
        @@all << self
        @@all_names << self.name.downcase
    end
    def self.all_names
        @@all_names
    end

    def number=(number)
        @number = number
    end

    def self.clear_names
        @@all_names.clear
    end

    def self.all
        @@all
    end

    def self.clear
        @@all.clear
    end
end

