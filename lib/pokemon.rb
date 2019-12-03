pokedex_array = doc.css(".grid-row li")

pokedex_array.each.with_index(1) do |pokedex, idx|
      version = pokedex.text
      index = idx
        # binding.pry
      info = pokedex.css("href value")
      url = "https://pokemondb.net#{pokedex.css("a")[0].attributes["href"].value}"
      poke_vers = Pokedex.new(version, url, info, index)
end

def printpoke
 Pokedex.all.each.with_index(1) do |pokedex, idx|
 puts "#{idx}. #{pokedex.version}"
 puts pokedex.url
 puts pokedex.info
 end
end

def dex_url(input)
    Pokedex.all.find {|pokedex| pokedex.index == input}.url
end

input = 1

list_doc = Nokogiri::HTML(open(dex_url(input)))

pokemon_array = list_doc.css("a.ent-name")

class Pokemon 

    attr_accessor :name, :number, :info, :url
    @@all = []
    def initialize(name, number, info, url)
        @name = name
        @number = number
        @info = info
        @url = url
        @@all << self 
    end
    def self.all
        @@all
    end
end


pokemon_array.uniq.each.with_index(1) do |pokemon, idx|
    number = idx
    #binding.pry
    url = "https://pokemondb.net#{pokemon.attributes["href"].value}" if !nil
    name = pokemon.text
    info = pokemon.text
    Pokemon.new(name, number, info, url)
end

def pront
Pokemon.all.each.with_index(1) do |pokemon, idx|
    if pokemon.number < 151
    puts pokemon.url
    puts "#{pokemon.number} #{idx}"
    end
end
end
pront



