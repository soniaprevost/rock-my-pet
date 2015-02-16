# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
cities = ["paris", "marseille", "lille", "bordeaux", "lyon"]
pets_array = ["cat", "dog", "hamster"]

Pet.destroy_all
5.times do
  pet = Pet.new({
    name: Faker::Company.name,
    city: cities.sample,
    street: Faker::Address.street_address,
    zipcode: Faker::Address.postcode.to_i,
    kind: pets_array.sample,
    description: Faker::Lorem.paragraph,
    price: 10,
    })
  pet.save
end