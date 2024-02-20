class Song
    @@id_count =0 #Modifiado paso6
    attr_reader :id  #Modifiado paso6
    def initialize( title:, artists:, album:, released:, id:nil) #Modifiado paso3. de initialize(id:, name:, description:, songs:)
        @id = id || @@id_count.next #Modifiado paso3
        @@id_count = @id #Modifiado paso6
        @title = title
        @artists = artists
        @album = album
        @released = released.to_i
    end 

    def details
        [@id, @title, @artists.join(", "), @album, @released]
    end
    def to_json(*args)  #Modifiado paso6
        {id: @id, title:@title, artists: @artists, album: @album, released: @released }.to_json(*args)  #Modifiado paso4
    end 
    def update(title:, artists:, album:, released:) #Parámetros nombrados
        @title = title unless title.empty? # Sobreescribes el name si no es vacío el name (si tú escribes nada o vacío, pones el objeto o la plabara anterior que estaba)
        @artists = artists unless artists.empty?
        @album = album unless album.empty?
        @released = released unless released.empty?
    end
end 
