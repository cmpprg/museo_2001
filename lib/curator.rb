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

  


end
