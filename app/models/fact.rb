class Fact < ApplicationRecord
  has_many :breed_facts, dependent: :destroy
  has_many :breeds, through: :breed_facts

  validates :fact, presence: true, length: { minimum: 5 }
end
