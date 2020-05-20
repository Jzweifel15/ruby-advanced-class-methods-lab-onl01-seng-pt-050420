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
    @@all.push(song)
    return song 
  end
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name
    return song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all.push(song)
    return song
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name }
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
  
  def self.new_from_filename(song_name, artist_name)
    song = self.new
    song.song_name = song_name.split("-").chomp!(".mp3")
    song.artist_name = artist_name.split("-")
  end
  

end
