require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
  end

  before(:each) do
    @garden1 = Garden.create!(name: 'Sparkys Garden', organic: true)
    @garden2 = Garden.create!(name: 'Blues Garden', organic: true)

    @plot1 = @garden1.plots.create!(number: 1, size: 'small', direction: 'North')
    @plot2 = @garden1.plots.create!(number: 4, size: 'large', direction: 'West')
    @plot3 = @garden2.plots.create!(number: 7, size: 'medium', direction: 'West')
    @plot4 = @garden1.plots.create!(number: 10, size: 'medium', direction: 'West')

    @plant1 = Plant.create!(name: 'Tomato Girl', description: 'Prefers full sun', days_to_harvest: 80)
    @plant2 = Plant.create!(name: 'Purple Beet', description: 'Water', days_to_harvest: 90)
    @plant3 = Plant.create!(name: 'Orange Carrot', description: 'Soil', days_to_harvest: 80)
    @plant4 = Plant.create!(name: 'Blue Blueberry', description: 'Bush', days_to_harvest: 60)
    @plant5 = Plant.create!(name: 'Green Apple', description: 'Tree', days_to_harvest: 120)

    @plot1.plants << [@plant1, @plant2]
    @plot2.plants << [@plant2, @plant4, @plant5]
    @plot3.plants << [@plant3]
    @plot4.plants << [@plant2, @plant1]
  end

  describe 'instance methods' do
    it 'retrieves plants with less than 100 days harvest by most seedlings' do
      expect(@garden1.low_harvest_plants_ordered.first.name).to eq(@plant2.name)
      expect(@garden1.low_harvest_plants_ordered.last.name).to eq(@plant4.name)
      expect(@garden1.low_harvest_plants_ordered.length).to eq(3)
    end
  end
end
