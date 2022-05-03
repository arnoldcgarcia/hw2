# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code. 
# TODO!
Actor.destroy_all
Role.destroy_all
Movie.destroy_all
Studio.destroy_all

# Generate models and tables, according to the domain model.
# TODO! 
# Note from Arn: The tables have been generated with Ruby Code

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
puts ""
puts "##################### HOMEWORK 2 ##################### "
puts "Hi Graders: I chose to use the .create function "
puts "since it's more efficient (it creates and saves) "
puts "and makes the code a lot shorter."
puts "###################################################### "

Studio.create(name: "Warner Bros.")

Actor.create(name: "Christian Bale")
Actor.create(name: "Michael Caine")
Actor.create(name: "Liam Neeson")
Actor.create(name: "Katie Holmes")
Actor.create(name: "Gary Oldman")
Actor.create(name: "Heath Ledger")
Actor.create(name: "Aaron Eckhart")
Actor.create(name: "Maggie Gyllenhaal")
Actor.create(name: "Tom Hardy")
Actor.create(name: "Joseph Gordon-Levitt")
Actor.create(name: "Anne Hathaway")

warnerbros = Studio.find_by({"name" => "Warner Bros."})["id"]

Movie.create(title: "Batman Begins", year_released: 2005, rated: "PG-13", studio_id: warnerbros)
Movie.create(title: "The Dark Knight", year_released: 2008, rated: "PG-13", studio_id: warnerbros)
Movie.create(title: "The Dark Knight Rises", year_released: 2012, rated: "PG-13", studio_id: warnerbros)

Role.create(movie_id: Movie.find_by({"title" => "Batman Begins"})["id"], actor_id: Actor.find_by({"name" => "Christian Bale"})["id"], character_name: "Bruce Wayne")
Role.create(movie_id: Movie.find_by({"title" => "Batman Begins"})["id"], actor_id: Actor.find_by({"name" => "Michael Caine"})["id"], character_name: "Alfred")
Role.create(movie_id: Movie.find_by({"title" => "Batman Begins"})["id"], actor_id: Actor.find_by({"name" => "Liam Neeson"})["id"], character_name: "Ra's Al Ghul")
Role.create(movie_id: Movie.find_by({"title" => "Batman Begins"})["id"], actor_id: Actor.find_by({"name" => "Katie Holmes"})["id"], character_name: "Rachel Dawes")
Role.create(movie_id: Movie.find_by({"title" => "Batman Begins"})["id"], actor_id: Actor.find_by({"name" => "Gary Oldman"})["id"], character_name: "Commissioner Gordon")

Role.create(movie_id: Movie.find_by({"title" => "The Dark Knight"})["id"], actor_id: Actor.find_by({"name" => "Christian Bale"})["id"], character_name: "Bruce Wayne")
Role.create(movie_id: Movie.find_by({"title" => "The Dark Knight"})["id"], actor_id: Actor.find_by({"name" => "Heath Ledger"})["id"], character_name: "Joker")
Role.create(movie_id: Movie.find_by({"title" => "The Dark Knight"})["id"], actor_id: Actor.find_by({"name" => "Aaron Eckhart"})["id"], character_name: "Harvey Dent")
Role.create(movie_id: Movie.find_by({"title" => "The Dark Knight"})["id"], actor_id: Actor.find_by({"name" => "Michael Caine"})["id"], character_name: "Alfred")
Role.create(movie_id: Movie.find_by({"title" => "The Dark Knight"})["id"], actor_id: Actor.find_by({"name" => "Maggie Gyllenhaal"})["id"], character_name: "Rachel Dawes")

Role.create(movie_id: Movie.find_by({"title" => "The Dark Knight Rises"})["id"], actor_id: Actor.find_by({"name" => "Christian Bale"})["id"], character_name: "Bruce Wayne")
Role.create(movie_id: Movie.find_by({"title" => "The Dark Knight Rises"})["id"], actor_id: Actor.find_by({"name" => "Gary Oldman"})["id"], character_name: "Commissioner Gordon")
Role.create(movie_id: Movie.find_by({"title" => "The Dark Knight Rises"})["id"], actor_id: Actor.find_by({"name" => "Tom Hardy"})["id"], character_name: "Bane")
Role.create(movie_id: Movie.find_by({"title" => "The Dark Knight Rises"})["id"], actor_id: Actor.find_by({"name" => "Joseph Gordon-Levitt"})["id"], character_name: "John Blake")
Role.create(movie_id: Movie.find_by({"title" => "The Dark Knight Rises"})["id"], actor_id: Actor.find_by({"name" => "Anne Hathaway"})["id"], character_name: "Selina Kyle")

# # Prints a header for the movies output
puts ""
puts "Movies"
puts "======"
puts ""

# # Query the movies data and loop through the results to display the movies output.
movies = Movie.all
studios = Studio.all
actors = Actor.all
roles = Role.all

for movie in movies
    name = movie["title"]
    year = movie["year_released"]
    rating = movie["rated"]
    studio = studios.find_by({"id" => movie["studio_id"]})["name"]
    puts "#{name}      #{year}      #{rating}      #{studio}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.

for role in roles
    movie_name = movies.find_by({"id" => role["movie_id"]})["title"]
    actor_name = actors.find_by({"id" => role["actor_id"]})["name"]
    character_name = role["character_name"]
    puts "#{movie_name}      #{actor_name}             #{character_name}"
end
