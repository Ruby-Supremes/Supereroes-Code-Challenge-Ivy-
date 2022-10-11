# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Seeding Superheroes and Superpowers..."

powers = [
    {name:"Super Strength: ", description: "Gives the wielder super human strengths"},
    {name:"Flight : ", description: "Gives the wielder the ability to fly through the skys at supersonic speed"},
    {name:"Super Human Senses: ", description: "Allows the person to user their senses at super human level"},
    {name:"Elasticity: ", description: "Can stretch the human body to extreme lengths"},
    {name:"Agile", description: "Can conform and is quick"},
    {name:"Gargantuan", description: "Strong, fast and powerful"},
    {name:"Commandeerer", description: "Intuitive ability to commandeer any vehicle. Mechanical ingenuity and engineering aptitude."}
    ]
  
  powers.each {|power| Power.create!(power)}
  
  15.times do
    Hero.create!(name: Faker::Superhero.name, super_name: Faker::Superhero.suffix)
  end
  
  5.times do
    HeroPower.create!(strength: ["Strong", "Average", "Weak"].shuffle.first, hero_id: rand(1..15), power_id: rand(1..7))
  end

puts "Done Seeding!"
