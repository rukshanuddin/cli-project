require 'nokogiri'
require 'open-uri'
require 'pry'

doc = Nokogiri::HTML(open("https://pokemondb.net/pokedex"))

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



