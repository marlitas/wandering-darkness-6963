# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Garden.create(name: 'Turing Community Garden', organic: true)
Garden.create(name: 'Main Street Garden', organic: false)

plot1 = Garden.first.plots.create(number: 345, size: 'Medium', direction: 'North')
plot2 = Garden.first.plots.create(number: 346, size: 'Large', direction: 'East')
plot3 = Garden.last.plots.create(number: 878, size: 'Small', direction: 'East')
plot4 = Garden.last.plots.create(number: 879, size: 'Small', direction: 'West')


plant1 = Plant.create!(name: 'Tomato Girl', description: 'Prefers full sun', days_to_harvest: 80)
plant2 = Plant.create!(name: 'Purple Beet', description: 'Water', days_to_harvest: 90)
plant3 = Plant.create!(name: 'Orange Carrot', description: 'Soil', days_to_harvest: 80)
plant4 = Plant.create!(name: 'Blue Blueberry', description: 'Bush', days_to_harvest: 60)
plant5 = Plant.create!(name: 'Green Apple', description: 'Tree', days_to_harvest: 120)

plot1.plants << [plant1, plant2]
plot2.plants << [plant2, plant4, plant5]
plot3.plants << [plant3]
plot4.plants << [plant3]
