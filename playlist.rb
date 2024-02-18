class Playlist
    @@id_count =0 #Modifiado paso3
    attr_reader :id  #Modifiado paso4
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
    def to_json(*args)  #Modifiado paso4
        {id: @id, name:@name, description: @description, songs: @songs}.to_json(*args)  #Modifiado paso4
    end 
    def update(name:, description:) #Parámetros nombrados
        @name = name unless name.empty? # Sobreescribes el name si no es vacío el name (si tú escribes nada o vacío, pones el objeto o la plabara anterior que estaba)
        @description = description unless description.empty?
    end
end 

