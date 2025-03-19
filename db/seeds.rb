# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'open-uri'
require 'json'
require 'csv'

puts "Clearing old data..."
BreedFact.delete_all
BreedDisease.delete_all
Fact.delete_all
DogDisease.delete_all
DogImage.delete_all
Breed.delete_all

puts "Importing Breeds from Dog API..."
breed_list_url = "https://dog.ceo/api/breeds/list/all"
breed_list_json = JSON.parse(URI.open(breed_list_url).read)
breed_list = breed_list_json["message"]  

breed_list.each do |breed_name, sub_breed_array|
  parent_breed = Breed.create(name: breed_name)

  sub_breed_array.each do |sub_name|
    Breed.create(
      name: sub_name,
      parent_id: parent_breed.id
    )
  end
end
puts "Breeds imported: #{Breed.count}"

puts "Importing random images for each Breed..."
Breed.find_each do |b|
  begin
    image_json = JSON.parse(URI.open("https://dog.ceo/api/breeds/image/random").read)
    DogImage.create(url: image_json["message"], breed: b)
  rescue => e
    puts "Failed to fetch image for breed #{b.name}: #{e.message}"
  end
end
puts "DogImages imported: #{DogImage.count}"

puts "Importing Facts from Dog Facts API..."
facts_url = "http://localhost:4567/api/facts?number=20"
facts_json = JSON.parse(URI.open(facts_url).read)
facts_array = facts_json["facts"]  
facts_array.each do |fact_text|
  Fact.create(fact: fact_text)
end
puts "Facts imported: #{Fact.count}"

all_facts = Fact.all
Breed.all.sample(10).each do |random_breed|
  selected_facts = all_facts.sample(3)
  selected_facts.each do |f|
    BreedFact.create(breed: random_breed, fact: f)
  end
end

puts "Importing Dog Diseases from CSV..."
csv_path = Rails.root.join('db', 'data/dog_diseases.csv')  
CSV.foreach(csv_path, headers: true) do |row|
  DogDisease.create(
    name: row["name"],
    description: row["description"]
  )
end
puts "DogDiseases imported: #{DogDisease.count}"

all_diseases = DogDisease.all
Breed.all.sample(15).each do |random_breed|
  selected_diseases = all_diseases.sample(2)
  selected_diseases.each do |d|
    BreedDisease.create(breed: random_breed, dog_disease: d)
  end
end

puts "Seeding done!"
