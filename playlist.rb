class Playlist
    def initialize(id:, name:, description:, songs:)
        @id = id
        @name = name
        @description = description
        @songs = songs
    end 

    def details
        [@id, @name, @description, "#{@songs.size} Songs"]
    end
end 

