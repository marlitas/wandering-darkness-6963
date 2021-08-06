class Plot < ApplicationRecord
  belongs_to :garden
  has_many :seedlings
  has_many :plants, through: :seedlings
end
