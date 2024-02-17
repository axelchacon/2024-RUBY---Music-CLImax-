require "json"
require "terminal-table"
require_relative "playlist"

store = JSON.parse(File.read('store.json'), symbolize_names:true) #Cambiar de JSON a hash con símboloso

playlists = store.map do |playlist| # playlist es un hash
    # Playlist.new(id: playlist[:id], name: playlist[:name], description: playlist[:description], songs: playlist[:songs])
    Playlist.new(**playlist)
end

def print_table(playlists)
    table = Terminal::Table.new 
    table.title = "Music CLImax"
    table.headings = ["ID", "List", "Description", "#Songs"]
    table.rows = playlists.map { |playlist| playlist.details}
    puts table
    
end

def create_playlist(playlists) #Modifiado paso3
    playlist_hash = playlist_form
    new_playlist = Playlist.new(**playlist_hash)
    playlists << new_playlist 
end

def playlist_form #Modifiado paso3
    print "Name: "
    name = gets.chomp
    print "Description: "
    description = gets.chomp
    {name: name, description: description}
end

def main_menu
  puts "create | show ID | update ID | delete ID | exit"
  print "> "
  action, id = gets.chomp.split #["Hola", "2"]# por defecto split da con espacio
  [action, id.to_i] #["Hola", 2]

end

action = ""
until action == "exit"
    print_table(playlists)
    action, id = main_menu
    case action
    when "create" then create_playlist(playlists) #Modifiado paso3
    when "show" then puts "show action with ID #{id}"
    when "update" then puts "update action with ID #{id}"
    when "delete" then puts "delete action with ID #{id}"
    when "exit" then puts "Goodbye!"
    else
        puts "Invalid action"
    end
end 


# pp playlists