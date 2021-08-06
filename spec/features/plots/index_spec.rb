require 'rails_helper'

RSpec.describe 'Plot Index' do
  before(:each) do
    @garden = Garden.create!(name: 'Sparkys Garden', organic: true)
    @plot1 = @garden.plots.create!(number: 1, size: 'small', direction: 'North')
    @plot2 = @garden.plots.create!(number: 4, size: 'large', direction: 'West')
    @plot3 = @garden.plots.create!(number: 7, size: 'medium', direction: 'West')

    @plant1 = Plant.create!(name: 'Tomato Girl', description: 'Prefers full sun', days_to_harvest: 80)
    @plant2 = Plant.create!(name: 'Purple Beet', description: 'Water', days_to_harvest: 90)
    @plant3 = Plant.create!(name: 'Orange Carrot', description: 'Soil', days_to_harvest: 80)
    @plant4 = Plant.create!(name: 'Blue Blueberry', description: 'Bush', days_to_harvest: 60)

    @plot1.plants << [@plant1, @plant2]
    @plot2.plants << [@plant2, @plant4]
    @plot3.plants << [@plant3]
  end
  describe 'visitor' do
    it 'displays all plots and their plants' do
      visit '/plots'

      within(:css, "##{@plot1.id}") do
        expect(page).to have_content(@plot1.number)
        expect(page).to have_content(@plant1.name)
        expect(page).to have_content(@plant2.name)
      end

      within(:css, "##{@plot2.id}") do
        expect(page).to have_content(@plot2.number)
        expect(page).to have_content(@plant2.name)
        expect(page).to have_content(@plant4.name)
      end

      within(:css, "##{@plot3.id}") do
        expect(page).to have_content(@plot3.number)
        expect(page).to have_content(@plant3.name)
      end
    end

    it 'can remove a plant from a plot' do
      visit '/plots'

      within(:css, "##{@plot1.id}") do
        expect(page).to have_content(@plant2.name)
      end

      within(:css, "##{@plot2.id}") do
        expect(page).to have_content(@plant2.name)
        expect(page).to have_content(@plant4.name)
        within(:css, "##{@plant2.id}") do
          click_on('Delete Plant')
        end
      end

      expect(current_path).to eq('/plots')

      within(:css, "##{@plot1.id}") do
        expect(page).to have_content(@plant2.name)
      end

      within(:css, "##{@plot2.id}") do
        expect(page).to_not have_content(@plant2.name)
        expect(page).to have_content(@plant4.name)
      end
    end
  end
end
