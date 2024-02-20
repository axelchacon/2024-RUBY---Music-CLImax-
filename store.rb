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