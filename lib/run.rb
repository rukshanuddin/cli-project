def greeting
    #Welcome screen greeting
    puts "\t\t\tWelcome\n\t\t\tto the\n\t\t\tworld\n\t\t\tof".yellow
    puts logo.to_s.yellow
    puts "Enter 'list' to list pokedexes".blue
    puts "Enter 'exit' to exit".red
end

def list_pokedex
    Pokedex.all.each.with_index(1) do |pokedex, idx|
        puts "#{idx}. #{pokedex.version}".red
        puts pokedex.info.blue
        puts pokedex.url.green
    end
end

def welcome
    input = gets.strip
    
    if input == "exit"
        puts "Gotta Catch 'Em All!'"     
    elsif input == "list"
        Scrape.pokedex
        list_pokedex
        puts "Enter your selection:"
        pokedex_selection
        pokemon_selection
    else
        print "Not ".red
        print "a "
        print "valid ".green 
        print "input! "
        print "Try again!\n".yellow
        puts "You can type 'list' or 'exit'"
        welcome    
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
            url = "https://pokemondb.net#{pokemon.attributes["href"].value}" if !nil
            name = pokemon.text
        if pokemon.text != pokemon_array[idx - 2].text
            Pokemon.new(name, url)
        end
    end
   print_poke

end



def print_poke
    Pokemon.all.each.with_index(1) do |pokemon, idx|
        puts "#{idx}. #{pokemon.name}"
        end
end




def pokedex_selection
        selection = gets.strip.to_i
        dex_html(selection)
        puts "Enter the name of a pokemon for more information:".yellow
end

def pokemon_selection
    pokemon = gets.strip
    Scrape.pokemon(pokemon)
end
def run
    greeting
    welcome

    
end

def logo
    <<~DOC
                                    .;:**'                           
                                `                                
    .:XHHHHk.              db.   .;;.     dH  MX                 
  oMMMMMMMMMMM       ~MM  dMMP :MMMMMR   MMM  MR      ~MRMN     
  QMMMMMb  "MMX       MMMMMMP !MX' :M~   MMM MMM  .oo. XMMM 'MMM
    `MMMM.  )M> :X!Hk. MMMM   XMM.o"  .  MMMMMMM X?XMMM MMM>!MMP
     'MMMb.dM! XM M'?M MMMMMX.`MMMMMMMM~ MM MMM XM `" MX MMXXMM 
      ~MMMMM~ XMM. .XM XM`"MMMb.~*?**~ .MMX M t MMbooMM XMMMMMP 
       ?MMM>  YMMMMMM! MM   `?MMRb.    `"""   !L"MMMMM XM IMMM  
        MMMX   "MMMM"  MM       ~%:           !Mh.""" dMI IMMP  
        'MMM.                                             IMX   
         ~M!M                                             IMP


         DOC
end   




