class Seedling < ApplicationRecord
  belongs_to :plant
  belongs_to :plot
end
