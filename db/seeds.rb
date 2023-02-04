# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Hat.create(size: 56, location: "New York", type: "Fedora", color: "Black", description: "A classic black fedora", day_rate: 15)
Hat.create(size: 58, location: "London", type: "Bowler", color: "Brown", description: "A stylish brown bowler", day_rate: 20)
Hat.create(size: 60, location: "Paris", type: "Top Hat", color: "Black", description: "A formal black top hat", day_rate: 25)