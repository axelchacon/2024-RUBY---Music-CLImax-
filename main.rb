require "json"
require "terminal-table"
require_relative "playlist"

# store = JSON.parse(file.read('store.json'), symbolize_names:true)
# pp File.read('store.json')
# pp JSON.parse(File.read('store.json')) #read hace la función de abrirlo, leerlo y cerrar el archcivo
store = JSON.parse(File.read('store.json'), symbolize_names:true) #Cambiar de JSON a hash con símboloso
# p store
# pp store
# p store[0][:name]

playlists = store.map do |playlist|
    # Playlist.new(id: playlist[:id], name: playlist[:name], description: playlist[:description], songs: playlist[:songs])
    Playlist.new(**playlist)
end
 ####################    Inicio Del  Ejemplo 6 del archivo ejemplos.rb    ###################################################
# table = Terminal::Table.new do |t|
#     # t.rows = [
#     #     [1, "Salsa", "Salsa latina", "3 songs"],
#     #     [2, "Rock", "Lo mejor", "2 songs"],
#     #     [1, "Salsa", "Salsa latina", "3 songs"]
#     # ]
#     t.title = "Music CLImax"
#     t.headings = ["ID", "List", "Description", "#Songs"]
#     t.rows = playlists.map { |playlist| playlist.details}
# end
# puts table
####################   Final Ejemplo 6     ###################################################
####################    Inicio Del  Ejemplo 6 como función reutiliable     ###################################################
def print_table(playlists)
    table = Terminal::Table.new 
    table.title = "Music CLImax"
    table.headings = ["ID", "List", "Description", "#Songs"]
    table.rows = playlists.map { |playlist| playlist.details}
    puts table
end
# print_table(playlists)
####################   Final Ejemplo 6   como función reutiliable   ###################################################
menu = "create | show ID | update ID | delete ID | exit"
action = ""
until action == "exit"
    print_table(playlists)
    puts menu
    print "> "
    action = gets.chomp
    case action
    when "create" then puts "create action"
    when "show" then puts "show action"
    when "update" then puts "update action"
    when "delete" then puts "delete action"
    when "exit" then puts "Goodbye!"
    else
        puts "Invalid action"
    end
end 


# pp playlists