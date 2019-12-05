require('pry')
require_relative('models/star')
require_relative('models/movie')
require_relative('models/casting')

Casting.delete_all
Movie.delete_all
Star.delete_all



star1 = Star.new({'first_name' => 'Ryan', 'last_name' => 'Gosling'})
star1.save()
star2 = Star.new({'first_name' => 'Alycia', 'last_name' => 'Debnam-Carey'})
star2.save()

movie1 = Movie.new({ 'title' => 'Drive', 'genre' => 'thriller'  })
movie1.save()

movie2 = Movie.new({'title' => 'Dream Life', 'genre' => 'horror' })
movie2.save()

casting1 = Casting.new({ 'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => 10000000})
casting1.save()
casting2 = Casting.new({'movie_id' => movie2.id, 'star_id' => star2.id, 'fee' => 20000000 })
casting2.save()


binding.pry
nil
