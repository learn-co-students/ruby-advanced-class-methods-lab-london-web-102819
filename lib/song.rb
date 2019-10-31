require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new 
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new 
    self.all << song 
    song.name = name 
    song
  end

  def self.create_by_name(name)
    song = self.new 
    self.all << song 
    song.name = name 
    song
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
  #  if self.all.find { |song| song.name == name }
  #    return self.all.find { |song| song.name == name }
  #  else 
  #    song = self.new 
  #    self.all << song 
  #    song.name = name 
  #    song
  #  end

    if self.find_by_name(name)
      return self.find_by_name(name)
    else 
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    remove_ext = filename.split(".")
    split_again = remove_ext[0].split(" - ")
    
    artist = split_again[0]
    song_name = split_again[1]
    
    song = self.new 
    self.all << song
    song.name = song_name 
    song.artist_name = artist 
    song
  end

  def self.create_from_filename(filename)
    remove_ext = filename.split(".")
    split_again = remove_ext[0].split(" - ")
    
    artist = split_again[0]
    song_name = split_again[1]
    
    song = self.new 
    self.all << song
    song.name = song_name 
    song.artist_name = artist 
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
