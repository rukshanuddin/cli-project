require_relative '../config/environment'

class Pokemon                                               
    #Define Pokemon Class
    attr_accessor :name, :url
    attr_reader :info, :number
    #Array of all objects
    @@all = []
    #Array of all Pokemon names
    @@all_names = []

    def initialize(name, url)
        @name = name
        @url = url
        @number = number
        @@all << self
        @@all_names << self.name.downcase
    end

    def self.find_by_name(name)
        @@all.find{|pokemon|pokemon.name == name}
    end

    def self.name_by_number(number)
        name = @@all.find{|pokemon| pokemon.number == number}.name
        name
    end
    def self.all_names
        @@all_names
    end

    def self.clear_names
        @@all_names.clear
    end

    def number=(number)
        @number = number
    end

    def self.all
        @@all
    end
    def self.clear
        @@all.clear
    end
end

