class Plant < ApplicationRecord
  has_many :seedlings
  has_many :plots, through: :seedlings
end
