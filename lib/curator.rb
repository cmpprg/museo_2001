require 'csv'
require './lib/photograph'
require './lib/artist'
class Curator

  attr_reader :photographs, :artists
  def initialize()
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find do |artist|
      artist.id == "1"
    end
  end

  def find_photos_from_artist_id(id)
    @photographs.find_all do |photo|
      photo.artist_id == id
    end
  end

  def photographs_by_artist
    @artists.reduce({}) do |photos_by_artist, artist|
      photos_by_artist[artist] = find_photos_from_artist_id(artist.id)
      photos_by_artist
    end
  end

  def artists_with_multiple_photographs
    array_of_artists = @artists.find_all do |artist|
      photographs_by_artist[artist].length > 1
    end
    array_of_artists.map{|artist| artist.name}
  end

  def photographs_taken_by_artist_from(country)
    @artists.each_with_object([]) do |artist, photographs|
      if artist.country == country
      photographs << find_photos_from_artist_id(artist.id)
      end
    end.flatten
  end

  def load_photographs(file_path)
    CSV.foreach(file_path, headers:true, header_converters: :symbol) do |row|
      add_photograph(Photograph.new(row))
    end
  end

  def load_artists(file_path)
    CSV.foreach(file_path, headers:true, header_converters: :symbol) do |row|
      add_artist(Artist.new(row))
    end
  end
end
