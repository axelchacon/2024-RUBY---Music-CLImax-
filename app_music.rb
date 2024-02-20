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
        print_table(list: @store.playlists, title: "Music CLImax", headings: ["ID", "List", "Descriptions", "#Songs"] )
        options = ["create", "show ID", "update ID", "delete ID", "exit"]
        action, id = menu(options)
        case action
        when "create" then create_playlist #Modifiado paso3
        when "show" then show_playlist(id)
        when "update" then update_playlist(id) #Modifiado paso4
        when "delete" then delete_playlist(id)
        when "exit" then puts "Goodbye!"
        else
          puts "Invalid action"
        end
      end 

    end
    private
    def print_table(list:, title:, headings:)  # reutiliable para songs y la canciones
        table = Terminal::Table.new 
        table.title = title # string
        table.headings = headings # array
        table.rows = list.map { |playlist| playlist.details} # array
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
######## con song
    def show_playlist(id)
      playlist = @store.find_playlist(id)
      action = ""
      until action == "back"
        print_table(list: playlist.songs,
         title: playlist.name, 
         headings: ["ID", "Title", "Artists", "Album", "Released"] )
        options = ["create", "update ID",  "delete ID", "back"]
        action, id = menu(options)
        case action
        when "create" then create_song(playlist)
        when "update" then update_song(playlist, id)
        when "delete" then delete_song(playlist, id)
        when "back" then next #Esto es para que regrese al programa anterior y es una palabra reservada
        else
          puts "Invalid action"
        end
      end 

    end
######## revisarrevisarrevisarrevisarrevisarrevisarrevisarrevisarrevisar inicio
    def create_song(playlist)
      song_data = song_form
      new_song = Song.new(**song_data)
      @store.add_song(playlist.id, new_song)
    end

    def update_song(playlist, id) #Modifado paso4
      new_data= song_form
      @store.update_song(id, new_data, playlist.id)
    end
    def delete_song(playlist, id)
      @store.delete_song(id, playlist.id)
    end

    def song_form #Modifiado paso3
      print "Title: "
      title = gets.chomp
      print "Artists: "
      artists = gets.chomp.split(", ").map {|artis| artis.strip}
      print "Album: "
      album = gets.chomp
      print "Released: "
      released = gets.chomp
      {title: title, artists: artists, album: album, released: released}
    end
######## revisarrevisarrevisarrevisarrevisarrevisarrevisarrevisarrevisar final
    def playlist_form #Modifiado paso3
        print "Name: "
        name = gets.chomp
        print "Description: "
        description = gets.chomp
        {name: name, description: description}
    end
    
    def menu(options) #options es un array. Ahora es reutlizable para canciones y songs
      puts options.join("|") #es string 
      print "> "
      action, id = gets.chomp.split #["Hola", "2"]# por defecto split da con espacio
      [action, id.to_i] #["Hola", 2]
    
    end
    
end

# store=Store.new("store.json")
# pp store
# store.playlists
# pp store
