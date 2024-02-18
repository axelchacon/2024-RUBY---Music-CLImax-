require "json"
require "terminal-table"
require_relative "playlist"
require_relative "store"
# En Ruby, la notación ** se utiliza para desempaquetar un hash y pasar sus pares clave-valor como argumentos nombrados a un método.
class AppMusic 
    def initialize
        @store=Store.new("store.json")
    end
    def start
      action = ""
      until action == "exit"
        print_table(@store.playlists)
        action, id = main_menu
        case action
        when "create" then create_playlist #Modifiado paso3
        when "show" then puts "show action with ID #{id}"
        when "update" then update_playlist(id) #Modifiado paso4
        when "delete" then delete_playlist(id)
        when "exit" then puts "Goodbye!"
        else
          puts "Invalid action"
        end
      end 

    end
    private
    def print_table(playlists)
        table = Terminal::Table.new 
        table.title = "Music CLImax"
        table.headings = ["ID", "List", "Description", "#Songs"]
        table.rows = playlists.map { |playlist| playlist.details}
        puts table
        
    end
    
    def create_playlist #Modifiado paso3
        playlist_hash = playlist_form
        # new_playlist = Playlist.new(name: playlist_hash[:name], description: playlist_hash[:description])
        new_playlist = Playlist.new(**playlist_hash)
        @store.add_playlist(new_playlist)
     
        
    end
    def update_playlist(id) #Modifado paso4
        playlist_hash = playlist_form
        @store.update_playlist(id, playlist_hash)
        # playlist_found.update(name: playlist_hash[:name], description: playlist_hash[:description]) #Modifiado paso4: .update es un método propio de la clase creada por ti
    end
    def delete_playlist(id)
        @store.delete_playlist(id)
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
    
end

# store=Store.new("store.json")
# pp store
# store.playlists
# pp store
