class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize

  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)

    song = self.new
    song.name = song_name
    song
    
  end

  def self.create_by_name(song_name)

    song = self.new
    song.name = song_name
    self.all << song
    song
    
  end

  def self.find_by_name(song_name)
    self.all.find{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    return self.find_by_name(song_name) if self.find_by_name(song_name)
    return self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new

    song_name = filename.split(" - ")[1][0..-5]
    song_artist = filename.split(" - ")[0]

    song.name = song_name
    song.artist_name = song_artist

    song

  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all = []
  end

end
