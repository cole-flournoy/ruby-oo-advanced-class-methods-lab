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
    song.save
    song
  end

  def self.new_by_name(name, artist_name=nil)
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_by_name(name, artist_name=nil)
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    seperate = filename.split(" - ")
    artist_name = seperate[0]
    song_name = seperate[1].chomp(".mp3")
    self.new_by_name(song_name, artist_name)
  end

  def self.create_from_filename(filename)
    seperate = filename.split(" - ")
    artist_name = seperate[0]
    song_name = seperate[1].chomp(".mp3")
    self.create_by_name(song_name, artist_name)
  end

  def self.destroy_all
    self.all.clear 
  end
end
