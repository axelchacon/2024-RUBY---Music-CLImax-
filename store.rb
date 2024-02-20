require_relative "playlist" ## No es neecsario ya que está cargado en main.rb
class Store 
    attr_reader :playlists
    def initialize(filename)
        @filename = filename #'store.json'
        @playlists = load_playlists
    end
    def add_playlist(new_playlist)
        playlists << new_playlist 
        # File.write('store.json', JSON.pretty_generate(playlists))
        save
    end
    def update_playlist(id, data)
        playlist_found = find_playlist(id) #Modifiado paso4
        playlist_found.update(**data) #Modifiado paso4: .update es un método propio de la clase creada por ti
        save
    
    end
    def delete_playlist(id)
        playlist_found = find_playlist(id)
        @playlists.delete(playlist_found)
        save
    end
    def find_playlist(id)
        @playlists.find {|playlist| playlist.id == id}
    end
    ## Creamos los métodos específicos para el song
    ######## revisarrevisarrevisarrevisarrevisarrevisarrevisarrevisarrevisar inicio
    def add_song(id, new_song)
        playlist = find_playlist(id)
        playlist.songs.push(new_song)
        save
    end

    def update_song(id,new_data, playlist_id)
        playlist = find_playlist(playlist_id) #Modifiado paso4
        song = find_song(id, playlist) #Modifiado paso4: .update es un método propio de la clase creada por ti
        song.update(**new_data)
        save
    end
    def delete_song(id, playlist_id )
        playlist = find_playlist(playlist_id) 
        playlist.songs.delete_if { |song| song.id == id}
        save
    end
    def find_song(id, playlist)
        playlist.songs.find {|song| song.id == id}
    end
        ######## revisarrevisarrevisarrevisarrevisarrevisarrevisarrevisarrevisar final
    private # palabra reservada del Ruby para clases el cual no se puede acceder externamente a estos métodos sino de manera interna

    def load_playlists
        store = JSON.parse(File.read(@filename), symbolize_names:true) #Cambiar de JSON a hash con símboloso
        store.map {|playlist| Playlist.new(**playlist)} # playlist es un array que contiene hashes
    # Playlist.new(id: playlist[:id], name: playlist[:name], description: playlist[:description], songs: playlist[:songs])
    end
    def save
        File.write(@filename, JSON.pretty_generate(@playlists))
    end
end