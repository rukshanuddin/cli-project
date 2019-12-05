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

    def self.info(pokemon)
        if pokemon == "Nidoran♂"
            puts Nokogiri::HTML(open("https://pokemondb.net/pokedex/nidoran-m")).css(".grid-col.span-md-6.span-lg-8").text
        elsif pokemon == "Nidoran♀"
        puts Nokogiri::HTML(open("https://pokemondb.net/pokedex/nidoran-f")).css(".grid-col.span-md-6.span-lg-8").text
        elsif pokemon == "Farfetch'd"
            puts Nokogiri::HTML(open("https://pokemondb.net/pokedex/farfetchd")).css(".grid-col.span-md-6.span-lg-8").text
        elsif pokemon == "Mr. Mime"
            puts Nokogiri::HTML(open("https://pokemondb.net/pokedex/mr-mime")).css(".grid-col.span-md-6.span-lg-8").text
        else   
            puts Nokogiri::HTML(open("https://pokemondb.net/pokedex/#{pokemon}")).css(".grid-col.span-md-6.span-lg-8").text.to_s.yellow
        end
    end

end