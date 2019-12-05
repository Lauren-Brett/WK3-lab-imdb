require_relative('../db/sql_runner')
require_relative('casting')
require_relative('movie')
require_relative('star')

class Movie

attr_reader :id
attr_accessor :title, :genre

def initialize(options)
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @genre = options['genre']
end

def save()
  sql = "INSERT INTO movies
  (
    title,
    genre
    ) VALUES (
      $1, $2
      ) RETURNING id;"
    values = [@title, @genre]
    movies = SqlRunner.run(sql, values)
    @id = movies[0]['id'].to_i
  end


  def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end


def self.all()
  sql = "SELECT * FROM movies"
  movies = SqlRunner.run(sql)
  result = movies.map{ |movie| Movie.new(movie)}
  return result
end


def update()
  sql = "UPDATE movies
  SET (
    title,
    genre
    ) = (
      $1, $2
      ) WHERE id = $3;"
  values = [@title, @genre, @id]
  SqlRunner.run(sql, values)
end


def star()
  sql = "SELECT stars.* FROM stars
  INNER JOIN castings
  ON castings.movie_id = movie.id
  WHERE star_id = $1"
  values = [@star_id]
  stars = SqlRunner.run(sql, values)
  results = stars.map{ |star| Star.new(star)}
  return results
end

end
