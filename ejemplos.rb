
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
#     def initialize( songs:, name:, description:, id:)
     
#         @name = name
#         @descriptionsff = description
#         @songs = songs
#         @id = id
#     end 
# end 

# playlists = store.map do |playlist|
#     # Playlist.new(id: playlist[:id], name: playlist[:name], description: playlist[:description], songs: playlist[:songs])
#     pp playlist
#     Playlist.new(**playlist)
    
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
# require "json"

# store = JSON.parse(File.read('store.json'), symbolize_names: true)


# class Playlist
#   def initialize(id, name, description, songs)
#     @id = id
#     @name = name
#     @description = description
#     @songs = songs
#   end
# end

# playlists = store.map do |playlist|
#   Playlist.new(playlist[:id], playlist[:name], playlist[:description], playlist[:songs])
# end

# pp playlists

# ####################      Ejemplo 5     ###################################################
# require "terminal-table"
# table = Terminal::Table.new do |t|
#   t.rows = [
#       [1, "Salsa", "Salsa latina", "3 songs"],
#       [2, "Rock", "Lo mejor", "2 songs"],
#       [1, "Salsa", "Salsa latina", "3 songs"]
#   ]
# end
# puts table

# ####################      Ejemplo 6     ###################################################
# require "json"
# require "terminal-table"
# require_relative "playlist"

# store = JSON.parse(File.read('store.json'), symbolize_names:true) #Cambiar de JSON a hash con símboloso


# playlists = store.map do |playlist|
#     # Playlist.new(id: playlist[:id], name: playlist[:name], description: playlist[:description], songs: playlist[:songs])
#     Playlist.new(**playlist)
# end

# table = Terminal::Table.new do |t|
#     t.title = "Music CLImax"
#     t.headings = ["ID", "List", "Description", "#Songs"]
#     t.rows = playlists.map { |playlist| playlist.details}
# end
# puts table

# ####################      Ejemplo 7    ###################################################

# poder = [2,4,5]
# p poder.map {|numero| numero*4 }
# puts "##########################"
# poder = "Hola Juancho"
# p poder.split(" ")

# puts "##########################"
# action, id = ["juan", "sos"]
# p action
# p id
#  puts "##########################"

# eres, un, *crack = ["juan", "sos", "sosa", "sosr", "sosbet"]
# pp eres
# pp un
# p crack
#  puts "##########################"
# ####################      Ejemplo 8    ###################################################
# require "json"
# class Person
#     def initialize(name:, age:)
#         @name= name
#         @age= age
#     end
#      ##### link : https://ruby-doc.org/stdlib-3.0.2/libdoc/json/rdoc/JSON.html
#     def to_json(*args)   #####  Here's the JSON addition for it:
#         {name: @name, age: @age}.to_json(*args)
#     end
# end
# person = Person.new(name: "Juan", age: 25)
# p JSON.generate(person)
# ####################      Ejemplo 9    ###################################################
# playlistf = {
#   id: 1,
#   title: "Amor narcotico",
#   artists: ["Chichi Peralta", "Son Familia"],
#   album: "Pa' Otro La'o",
#   released: 1997
# }

# # Utilizamos pp para imprimir la estructura antes de eliminar el elemento
# pp playlistf

# # Eliminamos el elemento con la clave :id
# playlistf.delete(:id)

# # Volvemos a imprimir para ver la estructura después de eliminar
# pp playlistf

# playlistarray = [1,"Amor narcotico", ["Chichi Peralta", "Son Familia"], 1997]

# # Eliminamos el elemento con la clave :id
# playlistarray.delete(playlistarray[0])

# # Volvemos a imprimir para ver la estructura después de eliminar
# pp playlistarray
# ####################      Ejemplo 10   ###################################################
# playlisthases = [
#     {
#   id: 1,
#   title: "Amor narcotico",
#   artists: ["Chichi Peralta", "Son Familia"],
#   album: "Pa' Otro La'o",
#   released: 1997
# } ,
# {
#   id: 2,
#   title: "Amor narcoticoddd",
#   artists: ["Chichi Peraltaddd", "Son Familiadd"],
#   album: "Pa' Otro La'oddd",
#   released: 199999
# },
# {
#   id: 3,
#   title: "Amor narcoticorrr",
#   artists: ["Chichi Peraltarr", "Son Famirrrlia"],
#   album: "Pa' Otro La'orrrr",
#   released: 19970
# }

# ]
# found_playlisthases = playlisthases.find { |elemento| elemento[:id] == 1 }
# pp  found_playlisthases
# # playlisthases.delete(  {
# #     id: 1,
# #     title: "Amor narcotico",
# #     artists: ["Chichi Peralta", "Son Familia"],
# #     album: "Pa' Otro La'o",
# #     released: 1997
# #   })
#   playlisthases.delete( found_playlisthases )

# # Volvemos a imprimir para ver la estructura después de eliminar
# pp playlisthases

# ####################      Ejemplo 11  ###################################################
# class Ejemplo
#     attr_reader :privados
#     def initialize(hola)
#         @hola=hola
#         @privados=privado
#     end
#     def publico
#       puts "Este es un método público"
#       privado
#     end
  
#     def otro_publico
#       puts "Este es otro método público"
#     end
  
#     private
  
#     def privado
#       puts "#{@hola}, Este es un método privado"
#     end
# end
  
#   # Crear una instancia de la clase
#   objeto = Ejemplo.new("Hola")

#   objeto.privados
# puts "#####################"
#   objeto.publico

#   puts "#####################"
#   objeto.otro_publico

#   puts "#####################"
#   objeto.privado

#   puts "#####################"
  # ####################      Ejemplo 12:instancia de clases  ###################################################
# class Person
#     def initialize(name:, age:)
#         @name= name
#         @age= age
#     end
# end
# people = [{name: "Juan", age:25}, {name: "Pedro", age:30}]
# people_intances = people.map {|person| Person.new(**person)}
# p people_intances