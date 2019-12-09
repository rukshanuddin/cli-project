class CLI
    #Array of all pokemon for which pictures are available
    @@picture_array = [
        "Bulbasaur",
        "Ivysaur",
        "Venusaur",
        "Charmander",
        "Charmeleon","Charizard","Squirtle","Wartortle","Blastoise","Caterpie",
        "Metapod","Butterfree","Weedle","Kakuna","Beedrill","Pidgey","Pidgeotto","Pidgeot",
        "Rattata","Raticate","Spearow","Fearow","Ekans","Arbok","Pikachu","Raichu","Sandshrew",
        "Sandslash","Nidoran♀","Nidorina","Nidoqueen","Nidoran♂","Nidorino","Nidoking","Clefairy",
        "Clefable","Vulpix","Ninetales","Jigglypuff","Wigglytuff","Zubat","Golbat","Oddish","Gloom",
        "Vileplume","Paras","Parasect","Venonat","Venomoth","Diglett","Dugtrio","Meowth","Persian","Psyduck",
        "Golduck","Mankey","Primeape","Growlithe","Arcanine","Poliwag","Poliwhirl","Poliwrath","Abra","Kadabra",
        "Alakazam","Machop","Machoke","Machamp","Bellsprout","Weepinbell","Victreebel","Tentacool","Tentacruel",
        "Geodude","Graveler","Golem","Ponyta","Rapidash","Slowpoke","Slowbro","Magnemite","Magneton","Farfetch'd",
        "Doduo","Dodrio","Seel","Dewgong","Grimer","Muk","Shellder","Cloyster","Gastly","Haunter","Gengar","Onix",
        "Drowzee","Hypno","Krabby","Kingler","Voltorb","Electrode","Exeggcute","Exeggutor","Cubone","Marowak","Hitmonlee",
        "Hitmonchan","Lickitung","Koffing","Weezing","Rhyhorn","Rhydon","Chansey","Tangela","Kangaskhan","Horsea","Seadra",
        "Goldeen","Seaking","Staryu","Starmie","Mr. Mime","Scyther","Jynx","Electabuzz","Magmar","Pinsir","Tauros","Magikarp",
        "Gyarados","Lapras","Ditto","Eevee","Vaporeon","Jolteon","Flareon","Porygon","Omanyte","Omastar","Kabuto","Kabutops",
        "Aerodactyl","Snorlax","Articuno","Zapdos","Moltres","Dratini","Dragonair","Dragonite","Mewtwo",
        "Mew"].map {|word| word.downcase}

    def initialize
        greeting
        main_menu
        run    
    end

    def slow_print(sentence)
        sentence.each_char {|letter| print letter; sleep(0.05)}
        print "\n"
    end
    def greeting
        slow_print("...")
        slow_print("Hello there! Welcome to the world of")
        dot_dot_dot(95)
        puts logo.to_s.yellow
        dot_dot_dot(95)
        slow_print("My name is OAK! People call me the POKEMON PROF! This world is inhabited by creatures called ")
        slow_print("POKEMON! For some people, POKEMON are pets. Others use them for fights. Myself...I study ")
        slow_print("POKEMON as a profession. On the desk there is my invention, POKEDEX! It automatically records ")
        slow_print("data on POKEMON you've seen or caught! It's a hi-tech encyclopedia!")
    end
    def main_menu
        puts "\t\t\tEnter 'list' to list PokeDexes\t\t\t\t\t\t".yellow.on_blue
        sleep(0.25)
        puts "\t\t\tEnter 'pics' to list all Pokemon with images available\t\t\t".white.on_red
        sleep(0.25)
        puts "\t\t\tEnter 'exit' to exit\t\t\t\t\t\t\t".blue.on_yellow
        sleep(0.25)
    end
    def list_pokedex
        #Lists all pokedexes
        Pokedex.list
    end
    def exit_animation
        #animation for exiting program
        dot_dot_dot(95)
        puts ash
        dot_dot_dot(95)
        slow_print("\t\tGotta\t\tCatch\t\t'Em\t\tAll!'")
        dot_dot_dot(95)
        puts ""
        sleep(1)
        puts logo.to_s.yellow
        dot_dot_dot(95)
    end
    def list_and_select_pokemon
        list_pokemon
        pokemon_selection
    end
    def pokedex_selection
        selection = gets.strip
        if selection.to_i <= 21 && selection.to_i != 0
            Scrape.populate_pokemon(selection.to_i)
            list_and_select_pokemon
        elsif selection == 'exit'
            exit_animation
        else
            not_valid
            enter_selection
            pokedex_selection
        end
        
    end
    def enter_selection
        puts "Enter your selection".black.on_yellow
    end
    def not_valid
        puts "Not a valid selection try again!".red.on_blue
    end
    def gathering_info
        puts "Gathering information. Please wait".red.on_white
        print "\n"
        dot_dot_dot(100)
        print "\n"
        puts "Here is your info!".red.on_white
        print "\n"
        dot_dot_dot(100)
        sleep(0.5)
    end

    def run
        Pokemon.clear
        Pokedex.clear
        Scrape.pokedex
        input = gets.strip
        if input == "exit"
            exit_animation
        elsif input == "list"
            list_pokedex
            enter_selection
            pokedex_selection
        elsif input == "pics"
            Scrape.populate_pokemon(17)
            list_and_select_pokemon       
        else
            not_valid
            puts "You can type 'pics', 'list or 'exit'".black.on_white
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
    def pick_a_pokemon
        print "Enter the name of a Pokemon or it's index for more information:\nor type 'exit' to go back to main menu:".yellow
        print "\n"
    end
    def pokemon_selection
        pick_a_pokemon
        input = gets.strip.downcase    
        if input.to_i > 0 && input.to_i < (Pokemon.all.size + 1)
            gathering_info
            if Pokemon.all.size == 151
                print_pokemon(input.to_i)
            else
                name = Pokemon.name_by_number(input.to_i).downcase
                if picture_array.include?(name)
                    print_pokemon(picture_array.index(name)+1)
                end
            end
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
            main_menu
            run
        else
            pick_a_pokemon
            puts "Please select from the following list!"
            sleep(1)
            dot_dot_dot(100)
            list_pokemon
            pokemon_selection
        end   
    end
    def picture_array
        @@picture_array
    end
end

