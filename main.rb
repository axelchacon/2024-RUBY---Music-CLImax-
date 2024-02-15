require "json"

# store = JSON.parse(file.read('store.json'), symbolize_names:true)
pp File.read('store.json')
pp JSON.parse(File.read('store.json')) #read hace la función de abrirlo, leerlo y cerrar el archcivo
store = JSON.parse(File.read('store.json'), symbolize_names:true) #Cambiar de JSON a hash con símboloso
p store
pp store
p store[0][:name]

playlists = store.map do |playlist|
    Playlist.new(id: playlist[:id], name: playlist[:name], description: playlist[:description], songs: playlist[:songs])
end

menu = "create | sow ID | update ID | delete ID | exit"
puts menu 
print "> "
action = gets.chomp
puts action
