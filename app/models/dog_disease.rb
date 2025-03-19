class DogDisease < ApplicationRecord
  has_many :breed_diseases
  has_many :breeds, through: :breed_diseases

  validates :name, presence: true, uniqueness: true
end
