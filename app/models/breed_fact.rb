class BreedFact < ApplicationRecord
  belongs_to :fact
  belongs_to :breed
end
