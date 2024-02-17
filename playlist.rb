class Playlist
    @@id_count =0 #Modifiado paso3
    def initialize( name:, description:, id:nil, songs: []) #Modifiado paso3. de initialize(id:, name:, description:, songs:)
        @id = id || @@id_count.next #Modifiado paso3
        @@id_count = @id #Modifiado paso3
        @name = name
        @description = description
        @songs = songs
    end 

    def details
        [@id, @name, @description, "#{@songs.size} Songs"]
    end
end 

