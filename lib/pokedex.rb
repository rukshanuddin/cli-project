require_relative '../config/environment'

class Pokedex
    #Define Pokedex Class
    attr_accessor :version, :url, :info, :index

        @@all = []

    def initialize(version, url, info, index)
        @version = version
        @url = url
        @index = index
        @info = info
        @@all << self
    end
    #define a way to lits all pokedexes
    def self.list
        @@all.each.with_index(1) do |pokedex, idx|
            puts "#{idx}. #{pokedex.version}".red
            puts pokedex.info.blue
            puts pokedex.url.green
            dot_dot_dot(15)
        end
    end

    def self.all
        @@all
    end

    def self.clear
        @@all.clear
    end

end