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
        playlist_found = playlists.find {|playlist| playlist.id == id} #Modifiado paso4
        playlist_found.update(**data) #Modifiado paso4: .update es un método propio de la clase creada por ti
        save
    
    end
    def delete_playlist(id)
        playlist_found = @playlists.find {|playlist| playlist.id == id}
        @playlists.delete(playlist_found)
        save
    end
    private # palabra reservada del Ruby para clases el cual no se puede acceder externamente a estos métodos sino de manera interna

    def load_playlists
        store = JSON.parse(File.read(@filename), symbolize_names:true) #Cambiar de JSON a hash con símboloso
        store.map {|playlist| Playlist.new(**playlist)} # playlist es un array
    # Playlist.new(id: playlist[:id], name: playlist[:name], description: playlist[:description], songs: playlist[:songs])
    end
    def save
        File.write(@filename, JSON.pretty_generate(@playlists))
    end
end