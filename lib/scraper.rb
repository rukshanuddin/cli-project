require_relative '../config/environment'

class Scrape

    
    def self.pokedex
        doc = Nokogiri::HTML(open("https://pokemondb.net/pokedex"))
        pokedex_array = doc.css(".grid-row li")

        pokedex_array.each.with_index(1) do |pokedex, idx|
            version = pokedex.text
            index = idx
            info = pokedex.css("href value")
            url = "https://pokemondb.net#{pokedex.css("a")[0].attributes["href"].value}"
            poke_vers = Pokedex.new(version, url, info, index)
        end
    end
    

end