require "json"
require "terminal-table"
require_relative "playlist"
# En Ruby, la notación ** se utiliza para desempaquetar un hash y pasar sus pares clave-valor como argumentos nombrados a un método.
store = JSON.parse(File.read('store.json'), symbolize_names:true) #Cambiar de JSON a hash con símboloso

playlists = store.map do |playlist| # playlist es un array
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
    # new_playlist = Playlist.new(name: playlist_hash[:name], description: playlist_hash[:description])
    new_playlist = Playlist.new(**playlist_hash)
    playlists << new_playlist 
    File.write('store.json', JSON.pretty_generate(playlists)) #Modifiado paso4: JSON.pretty_generate(playlists) es la lista actulizada para que se actualice el JSON
end
def update_playlist(playlists, id) #Modifiado paso4
    playlist_found = playlists.find {|playlist| playlist.id == id} #Modifiado paso4
    playlist_hash = playlist_form
    # playlist_found.update(name: playlist_hash[:name], description: playlist_hash[:description]) #Modifiado paso4: .update es un método propio de la clase creada por ti
    playlist_found.update(**playlist_hash) #Modifiado paso4: .update es un método propio de la clase creada por ti
    File.write('store.json', JSON.pretty_generate(playlists))#Modifiado paso4
end
def delete_playlist(playlists, id)
    playlist_found = playlists.find {|playlist| playlist.id == id} #Modifiado paso4

    playlists.delete(playlist_found) #Modifiado paso4: .delete es un método propio del mismo Ruby en array
    File.write('store.json', JSON.pretty_generate(playlists))#Modifiado paso4
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
    when "update" then update_playlist(playlists, id) #Modifiado paso4
    when "delete" then delete_playlist(playlists, id)
    when "exit" then puts "Goodbye!"
    else
        puts "Invalid action"
    end
end 


# pp playlists