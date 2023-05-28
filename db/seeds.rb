# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "open-uri"

url = "https://tmdb.lewagon.com/movie/top_rated"

movie_serialized = URI.open(url).read
movie = JSON.parse(movie_serialized)

# puts "#{movie["results"][0]["original_title"]}"


puts "Cleaning database..."
Movie.destroy_all

puts "Creating 10 movie..."

movie_1 = {
  title: "#{movie["results"][0]["original_title"]}",
  overview: "#{movie["results"][0]["overview"]}",
  poster_url: "https://image.tmdb.org/t/p/original#{movie["results"][0]["poster_path"]}",
  rating: "#{movie["results"][0]["vote_average"]}".to_i
}

movie_2 = {
  title: "#{movie["results"][1]["original_title"]}",
  overview: "#{movie["results"][1]["overview"]}",
  poster_url: "https://image.tmdb.org/t/p/original#{movie["results"][1]["poster_path"]}",
  rating: "#{movie["results"][1]["vote_average"]}".to_i
}

movie_3 = {
  title: "#{movie["results"][2]["original_title"]}",
  overview: "#{movie["results"][2]["overview"]}",
  poster_url: "https://image.tmdb.org/t/p/original#{movie["results"][2]["poster_path"]}",
  rating: "#{movie["results"][2]["vote_average"]}".to_i
}

movie_4 = {
  title: "#{movie["results"][4]["original_title"]}",
  overview: "#{movie["results"][4]["overview"]}",
  poster_url: "https://image.tmdb.org/t/p/original#{movie["results"][4]["poster_path"]}",
  rating: "#{movie["results"][4]["vote_average"]}".to_i
}

movie_5 = {
  title: "#{movie["results"][5]["original_title"]}",
  overview: "#{movie["results"][5]["overview"]}",
  poster_url: "https://image.tmdb.org/t/p/original#{movie["results"][5]["poster_path"]}",
  rating: "#{movie["results"][5]["vote_average"]}".to_i
}

movie_6 = {
  title: "#{movie["results"][11]["original_title"]}",
  overview: "#{movie["results"][11]["overview"]}",
  poster_url: "https://image.tmdb.org/t/p/original#{movie["results"][11]["poster_path"]}",
  rating: "#{movie["results"][11]["vote_average"]}".to_i
}

movie_7 = {
  title: "#{movie["results"][7]["original_title"]}",
  overview: "#{movie["results"][7]["overview"]}",
  poster_url: "https://image.tmdb.org/t/p/original#{movie["results"][7]["poster_path"]}",
  rating: "#{movie["results"][7]["vote_average"]}".to_i
}

movie_8 = {
  title: "#{movie["results"][12]["original_title"]}",
  overview: "#{movie["results"][12]["overview"]}",
  poster_url: "https://image.tmdb.org/t/p/original#{movie["results"][12]["poster_path"]}",
  rating: "#{movie["results"][12]["vote_average"]}".to_i
}

movie_9 = {
  title: "#{movie["results"][14]["original_title"]}",
  overview: "#{movie["results"][14]["overview"]}",
  poster_url: "https://image.tmdb.org/t/p/original#{movie["results"][14]["poster_path"]}",
  rating: "#{movie["results"][14]["vote_average"]}".to_i
}

movie_10 = {
  title: "#{movie["results"][10]["original_title"]}",
  overview: "#{movie["results"][10]["overview"]}",
  poster_url: "https://image.tmdb.org/t/p/original#{movie["results"][10]["poster_path"]}",
  rating: "#{movie["results"][10]["vote_average"]}".to_i
}

movies = [movie_1, movie_2, movie_3, movie_4, movie_5, movie_6, movie_7, movie_8, movie_9, movie_10]

movies.each do |attributes|
  movie = Movie.create!(attributes)
  puts "Created #{movie.title}"
end

puts "#{Movie.count} in total - Creation completed"

# list generator

genres = ["Classics", "Superhero", "Drama", "Science-Fiction", "Fantasy", "Action", "Horror"]

puts 'Cleaning list database...'
List.destroy_all

puts 'Creating lists...'

genres.each do |list|
  List.create(name: list)
  puts "Creating #{List.name}"
end

puts "#{List.count} in total - Creation completed"
