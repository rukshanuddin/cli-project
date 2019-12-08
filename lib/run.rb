class CLI

    @@picture_array = ["Bulbasaur", "Ivysaur","Venusaur","Charmander","Charmeleon","Charizard","Squirtle","Wartortle","Blastoise","Caterpie","Metapod","Butterfree","Weedle","Kakuna","Beedrill","Pidgey","Pidgeotto","Pidgeot","Rattata","Raticate","Spearow","Fearow","Ekans","Arbok","Pikachu","Raichu","Sandshrew","Sandslash","Nidoran♀","Nidorina","Nidoqueen","Nidoran♂","Nidorino","Nidoking","Clefairy","Clefable","Vulpix","Ninetales","Jigglypuff","Wigglytuff","Zubat","Golbat","Oddish","Gloom","Vileplume","Paras","Parasect","Venonat","Venomoth","Diglett","Dugtrio","Meowth","Persian","Psyduck","Golduck","Mankey","Primeape","Growlithe","Arcanine","Poliwag","Poliwhirl","Poliwrath","Abra","Kadabra","Alakazam","Machop","Machoke","Machamp","Bellsprout","Weepinbell","Victreebel","Tentacool","Tentacruel","Geodude","Graveler","Golem","Ponyta","Rapidash","Slowpoke","Slowbro","Magnemite","Magneton","Farfetch'd","Doduo","Dodrio","Seel","Dewgong","Grimer","Muk","Shellder","Cloyster","Gastly","Haunter","Gengar","Onix","Drowzee","Hypno","Krabby","Kingler","Voltorb","Electrode","Exeggcute","Exeggutor","Cubone","Marowak","Hitmonlee","Hitmonchan","Lickitung","Koffing","Weezing","Rhyhorn","Rhydon","Chansey","Tangela","Kangaskhan","Horsea","Seadra","Goldeen","Seaking","Staryu","Starmie","Mr. Mime","Scyther","Jynx","Electabuzz","Magmar","Pinsir","Tauros","Magikarp","Gyarados","Lapras","Ditto","Eevee","Vaporeon","Jolteon","Flareon","Porygon","Omanyte","Omastar","Kabuto","Kabutops","Aerodactyl","Snorlax","Articuno","Zapdos","Moltres","Dratini","Dragonair","Dragonite","Mewtwo","Mew"].map {|word| word.downcase}

    def initialize
        greeting
        run    
    end
    def greeting
        #Welcome screen greeting
        print "W"
        sleep(0.05)
        print "e"
        sleep(0.05)
        print "l"
        sleep(0.05)
        print "c"
        sleep(0.05)
        print "o"
        sleep(0.05)
        print "m"
        sleep(0.05)
        print "e"
        sleep(0.05)
        print " "
        sleep(0.05)
        print "t"
        sleep(0.05)
        print "o"
        sleep(0.05)
        print " "
        sleep(0.05)
        print "t"
        sleep(0.05)
        print "h"
        sleep(0.05)
        print "e"
        sleep(0.05)
        print " "
        sleep(0.05)
        print "w"
        sleep(0.05)
        print "o"
        sleep(0.05)       
        print "r"
        sleep(0.05)       
        print "l"
        sleep(0.05)       
        print "d "
        sleep(0.05)       
        print "o"
        sleep(0.05)       
        print "f\n"
        sleep(0.1)
        puts logo.to_s.yellow
        puts "Enter 'list' to list pokedexes".blue
        sleep(0.25)
        puts "Enter 'exit' to exit".red
        sleep(0.25)
    end
    def list_pokedex
        #Lists all pokedexes
        Pokedex.all.each.with_index(1) do |pokedex, idx|
            puts "#{idx}. #{pokedex.version}".red
            puts pokedex.info.blue
            puts pokedex.url.green
            dot_dot_dot(15)
        end
    end
    def exit_animation
        #animation for exiting program
        dot_dot_dot(95)
        puts ash
        dot_dot_dot(95)
        print "\t\tGotta"
        sleep(0.25)
        print "\t\tCatch "
        sleep(0.25)
        print "\t\t'Em"
        sleep(0.25)
        print "\t\tAll!'\n"
        sleep(1)
        dot_dot_dot(95)
        puts ""
        sleep(1)
        puts logo.to_s.yellow
        dot_dot_dot(95)
    end
    def pokedex_selection
        selection = gets.strip
        if selection.to_i <= 21 && selection.to_i != 0
            Scrape.populate_pokemon(selection.to_i)
            list_pokemon
            pokemon_selection
        elsif selection == 'exit'
            exit_animation
        else
            puts "Not a valid selection try again!".red
            puts "Enter your selection".yellow
            pokedex_selection
        end
        
    end
    def gathering_info
        print "Gathering information. Please wait"
        dot_dot_dot(100)
        puts "Here is your info!".green
        dot_dot_dot(100)
        sleep(0.5)
    end

    def run
        Pokemon.clear
        Pokedex.clear
        input = gets.strip
        if input == "exit"
            exit_animation
        elsif input == "list"
            Scrape.pokedex
            list_pokedex
            puts "Enter your selection:"
            pokedex_selection        
        else
            print "Not ".red
            print "a "
            print "valid ".green 
            print "input! "
            print "Try again!\n".yellow
            puts "You can type 'list' or 'exit'"
            run    
        end
    end

    def list_pokemon
        Pokemon.all.each.with_index(1) do |pokemon, idx|
            puts "#{idx}. #{pokemon.name}"
            pokemon.number = idx
            sleep(0.02)
            end
    end

    def pokemon_selection
        
        puts "Enter the name of a Pokemon for more information or type 'exit' to go back to main menu:".yellow
        input = gets.strip.downcase    
        if input.to_i > 0 && input.to_i < (Pokemon.all.size + 1)
            gathering_info
            print_pokemon(input.to_i)
            dot_dot_dot(100)
            Scrape.by_number(input.to_i)
            dot_dot_dot(100)
            pokemon_selection
        elsif Pokemon.all_names.include?(input)
            gathering_info
            if picture_array.include?(input)
                print_pokemon(picture_array.index(input)+1)
                dot_dot_dot(100)
            end
            Scrape.pokemon(input)
            dot_dot_dot(100)
            pokemon_selection
        elsif input == 'exit'
            greeting
            run
        else
            puts "Please select from this list!"
            dot_dot_dot(100)
            list_pokemon
            pokemon_selection
        end   
    end
    def picture_array
        @@picture_array
    end
end

