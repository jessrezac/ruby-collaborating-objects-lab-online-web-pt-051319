class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    file_properties = filename.split(" - ")
    artist_name = file_properties[0]
    song_name = file_properties[1]
    song = Song.new(song_name)
    song.artist = song.artist_name(artist_name)
    song
  end

  def artist_name(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
    artist
  end

end
