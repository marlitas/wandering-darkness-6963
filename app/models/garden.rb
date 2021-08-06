class Garden < ApplicationRecord
  has_many :plots

  def low_harvest_plants
    self.plots
    .joins(:plants)
    .select('plants.*')
    .where('days_to_harvest < 100')
    .order('plants.id')
    .distinct
  end
end
