class DogImage < ApplicationRecord
  belongs_to :breed
  validates :url, presence: true
end
