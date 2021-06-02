class FetchMovies
  include HTTParty

  def initialize(imbd_movie_ids)
    @movies_ids = imbd_movie_ids
  end

  def fetch_movies
    @movies_ids.each do |movie_id|
      movie = HTTParty.get("http://www.omdbapi.com/?i=#{movie_id}&apikey=#{ENV['MOVIE_API_KEY']}&r=json")
      sleep(2)
      if movie.code == 200
        data = movie.parsed_response
        movie = Movie.find_or_create_by(imdb_id: data['imdbID'])
        movie.name = data['Title']
        movie.description = data['Plot']
        movie.release_date = data['Released']
        movie.rating = data['Ratings'].first['Value']
        movie.imdb_rating = data['imdbRating']
        movie.run_time = data['Runtime']
        movie.save
      end
    end
  end
end
