require 'csv'

class ImportJob
  def run
    delete_all
    import_movies
    import_reviews
  end

  def delete_all
    Review.delete_all
    MovieActor.delete_all
    MovieLocation.delete_all
    Actor.delete_all
    Location.delete_all
    User.delete_all
    Movie.delete_all
  end

  def import_movies(filename="movies.csv")
    rows = CSV.read(File.join("data", filename), headers: true)
    rows.each do |row|
      movie_row = row.to_hash

      movie_title = movie_row["Movie"]
      movie = Movie.find_by(title: movie_title) 
      unless movie
        movie = Movie.new
        movie.title = movie_title
        movie.description = movie_row["Description"]
        movie.year = movie_row["Year"].to_i
        movie.director = movie_row["Director"]
        movie.save
      end

      actor_name = movie_row["Actor"]
      actor = Actor.find_by(name: actor_name)
      unless actor
        actor = Actor.new
        actor.name = actor_name
        actor.save
      end

      location_place = movie_row["Filming location"]
      location = Location.find_by(place: location_place)
      unless location
        location = Location.new
        location.place = location_place 
        location.country = movie_row["Country"]
        location.save
      end

      movie.actors << actor
      movie.locations << location
    end
  end

  def import_reviews(filename="reviews.csv")
    rows = CSV.read(File.join("data", filename), headers: true)
    rows.each do |row|
      review_row = row.to_hash

      movie_title = review_row["Movie"]
      movie = Movie.find_by(title: movie_title)
      return if movie.nil?

      user_name = review_row["User"]
      user = User.find_by(name: user_name)
      unless user
        user = User.new
        user.name = user_name
        user.save
      end

      review = Review.new
      review.movie = movie
      review.user = user
      review.stars = review_row["Stars"].to_i
      review.review = review_row["Review"]
      review.save
    end
  end
end