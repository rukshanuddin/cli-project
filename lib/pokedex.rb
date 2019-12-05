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

def list_pokedex
    Pokedex.all.each.with_index(1) do |pokedex, idx|
        puts "#{idx}. #{pokedex.version}"
        puts pokedex.url
        puts pokedex.info
    end
end

def welcome(input)
    Scrape.pokedex
    if input == "list"
        list_pokedex
        puts "Enter your selection:"
    elsif input == "exit"
        puts "Gotta Catch 'em All!"
    else
        puts "not a valid response"
    end
end