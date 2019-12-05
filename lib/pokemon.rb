require_relative '../config/environment'

class Pokemon                                               #Define Pokemon class

    attr_accessor :name,  :info, :url
    @@all = []
    def initialize(name, info, url)
        @name = name

        @info = info
        @url = url
        @@all << self 
    end
    def self.all
        @@all
    end
end

def dex_url(input)
    Pokedex.all.find {|pokedex| pokedex.index == input}.url
end

# input = 1
def dex_html(input)
    list_doc = Nokogiri::HTML(open(dex_url(input)))
    pokemon_array = list_doc.css("a.ent-name")
    
    pokemon_array.each.with_index(1) do |pokemon, idx|
        
            number = idx
     #binding.pry
            url = "https://pokemondb.net#{pokemon.attributes["href"].value}" if !nil
            name = pokemon.text
            info = pokemon.text
        if pokemon.text != pokemon_array[idx - 2].text
            Pokemon.new(name, info, url)
        end
    end
    pront
end



def pront
Pokemon.all.each.with_index(1) do |pokemon, idx|
    if idx < 151
    puts pokemon.url
    puts "#{idx}. #{pokemon.name}"
    end
end
end
# end
# pront



