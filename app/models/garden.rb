class Garden < ApplicationRecord
  has_many :plots

  def low_harvest_plants_ordered
    self.plots
    .joins(:plants)
    .select('plants.*, COUNT(seedlings.plant_id) as plant_count')
    .where('days_to_harvest < 100')
    .group('plants.id')
    .order('plant_count desc')
    .distinct
  end
end
