require_relative '../config/environment'

class Pokedex

    attr_accessor :version, :url, :info, :index

        @@all = []
    def initialize(version, url, info, index)
        @version = version
        @url = url
        @index = index
        @info = info
        @@all << self
    end

    def self.all
        @@all
    end

    def self.clear
        @@all.clear
    
    end

end

def printpoke
    Pokedex.all.each.with_index(1) do |pokedex, idx|
        puts "#{idx}. #{pokedex.version}"
        puts pokedex.url
        puts pokedex.info
    end
end

