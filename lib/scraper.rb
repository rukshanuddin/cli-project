require_relative '../config/environment'

class Scrape

    
    def self.pokedex
        #Scrapes list of pokedex
        doc = Nokogiri::HTML(open("https://pokemondb.net/pokedex"))
        pokedex_array = doc.css(".grid-row li")

        pokedex_array.each.with_index(1) do |pokedex, idx|
            version = pokedex.css("a").text
            index = idx
            
            info = pokedex.css(".text-muted").text
            url = "https://pokemondb.net#{pokedex.css("a")[0].attributes["href"].value}"
            Pokedex.new(version, url, info, index)
        end
    end

    def self.populate_pokemon(input)
        #Scrapes list of pokemon and creates Pokemon objects
        list_doc = Nokogiri::HTML(open(Scrape.dex_url(input)))
        pokemon_array = list_doc.css("a.ent-name")       
        pokemon_array.each.with_index(1) do |pokemon, idx|
                url = "https://pokemondb.net#{pokemon.attributes["href"].value}" if !nil
                name = pokemon.text
                if pokemon.text != pokemon_array[idx - 2].text
                    Pokemon.new(name, url)
                end
            end
    end

    def self.dex_url(input)
        #Gets url for a pokedex for self.populate method based on input
        Pokedex.all.find {|pokedex| pokedex.index == input}.url
    end

    def self.pokemon(pokemon)
        #Scrapes info for pokemon based on name
        if pokemon == "nidoran♂"
            puts Nokogiri::HTML(open("https://pokemondb.net/pokedex/nidoran-m")).css(".grid-col.span-md-6.span-lg-8").text.to_s.yellow
        elsif pokemon == "nidoran♀"
            puts Nokogiri::HTML(open("https://pokemondb.net/pokedex/nidoran-f")).css(".grid-col.span-md-6.span-lg-8").text.to_s.yellow
        elsif pokemon == "farfetch'd"
            puts Nokogiri::HTML(open("https://pokemondb.net/pokedex/farfetchd")).css(".grid-col.span-md-6.span-lg-8").text.to_s.yellow
        elsif pokemon == "mr. mime"
            puts Nokogiri::HTML(open("https://pokemondb.net/pokedex/mr-mime")).css(".grid-col.span-md-6.span-lg-8").text.to_s.yellow
        else   
            puts Nokogiri::HTML(open("https://pokemondb.net/pokedex/#{pokemon}")).css(".grid-col.span-md-6.span-lg-8").text.to_s.yellow
        end
    end

    def self.by_number(number)
        #scrapes info for pokemon based on list number
        pokemon = Pokemon.all.find{|pokemon| pokemon.number == number}.name
        Scrape.pokemon(pokemon)
    end
end