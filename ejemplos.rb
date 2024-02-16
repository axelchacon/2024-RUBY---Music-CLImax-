
# ####################      Ejemplo 1       ###################################################
# require 'json'

# json_string = '{"nombre": "Juan", "edad": 25, "ciudad": "Ciudad de Ejemplo"}'


# # Utiliza JSON.parse para convertir la cadena JSON en un objeto Ruby
# ruby_objeto = JSON.parse(json_string)
# pp json_string
# pp ruby_objeto
# # Ahora `ruby_objeto` es un objeto Ruby que puedes manipular
# puts ruby_objeto["nombre"] # Imprime "Juan"
# puts ruby_objeto['edad']   # Imprime 25
# puts ruby_objeto['ciudad'] # Imprime "Ciudad de Ejemplo"

# puts ruby_objeto1["nombre"] # Imprime "Juan"
# puts ruby_objeto1['edad']   # Imprime 25
# puts ruby_objeto1['ciudad'] # Imprime "Ciudad de Ejemplo"

# ####################      Ejemplo 2      ###################################################

# require "json"

# # store = JSON.parse(file.read('store.json'), symbolize_names:true)
# # pp File.read('store.json')
# # pp JSON.parse(File.read('store.json')) #read hace la función de abrirlo, leerlo y cerrar el archcivo
# store = JSON.parse(File.read('store.json'), symbolize_names:true) #Cambiar de JSON a hash con símboloso
# # p store
# # pp store
# # p store[0][:name]
# # menu = "create | sow ID | update ID | delete ID | exit"
# # puts menu 
# # print "> "
# # action = gets.chomp
# # puts action
# class Playlist
#     def initialize(id:, name:, description:, songs:)
#         @id = id
#         @name = name
#         @description = description
#         @songs = songs
#     end 
# end 

# playlists = store.map do |playlist|
#     Playlist.new(id: playlist[:id], name: playlist[:name], description: playlist[:description], songs: playlist[:songs])
# end

# ####################      Ejemplo 3     ###################################################
# require "json"
# store = JSON.parse(File.read('store.json'), symbolize_names:true) #Cambiar de JSON a hash con símboloso
# class Playlist
#     def initialize(id:, name:, description:, songs:)
#         @id = id
#         @name = name
#         @description = description
#         @songs = songs
#     end 
# end 

# playlists = store.map do |playlist|
#     Playlist.new(id: playlist[:id], name: playlist[:name], description: playlist[:description], songs: playlist[:songs])
# end
# pp playlists


# ####################      Ejemplo 4     ###################################################
# require "json"

# store = JSON.parse(File.read('store.json'), symbolize_names: true)

# class Song
#   def initialize(id, title, artists, album, released)
#     @id = id
#     @title = title
#     @artists = artists
#     @album = album
#     @released = released
#   end
# end

# class Playlist
#   def initialize(id, name, description, songs)
#     @id = id
#     @name = name
#     @description = description
#     @songs = songs.map { |song| Song.new(song[:id], song[:title], song[:artists], song[:album], song[:released]) }
#   end
# end

# playlists = store.map do |playlist|
#   Playlist.new(playlist[:id], playlist[:name], playlist[:description], playlist[:songs])
# end

# pp playlists



# ####################      Ejemplo 5     ###################################################
require "json"

store = JSON.parse(File.read('store.json'), symbolize_names: true)


class Playlist
  def initialize(id, name, description, songs)
    @id = id
    @name = name
    @description = description
    @songs = songs
  end
end

playlists = store.map do |playlist|
  Playlist.new(playlist[:id], playlist[:name], playlist[:description], playlist[:songs])
end

pp playlists