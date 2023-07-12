class Song
  attr_accessor :name, :artist, :genre

  @@count = 0
  @@genres = []
  @@artists = {}

  def initialize(name, artist, genre)
    @name = name
    @artist = artist
    @genre = genre
    @@count += 1
    @@genres << genre
    @@artists[artist] ||= 0
    @@artists[artist] += 1
  end

  def self.count
    @@count
  end

  def self.genres
    @@genres.uniq
  end

  def self.artists
    @@artists.keys
  end

  def self.genre_count
    genre_histogram = Hash.new(0)
    @@genres.each { |genre| genre_histogram[genre] += 1 }
    genre_histogram
  end

  def self.artist_count
    @@artists
  end
end

ninety_nine_problems = Song.new("99 Problems", "Jay-Z", "rap")
puts ninety_nine_problems.name # Output: "99 Problems"
puts ninety_nine_problems.artist # Output: "Jay-Z"
puts ninety_nine_problems.genre # Output: "rap"

puts Song.count # Output: 1

puts Song.genres # Output: ["rap"]

puts Song.artists # Output: ["Jay-Z"]

puts Song.genre_count # Output: {"rap"=>1}

puts Song.artist_count # Output: {"Jay-Z"=>1}
