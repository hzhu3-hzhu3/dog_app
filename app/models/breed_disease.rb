class BreedDisease < ApplicationRecord
  belongs_to :breed
  belongs_to :dog_disease
end
