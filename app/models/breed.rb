class Breed < ApplicationRecord
  has_many :sub_breeds, class_name: "Breed", foreign_key: :parent_id, dependent: :destroy
  belongs_to :parent_breed, class_name: "Breed", optional: true, foreign_key: :parent_id

  has_many :dog_images, dependent: :destroy

  has_many :breed_facts, dependent: :destroy
  has_many :facts, through: :breed_facts

  has_many :breed_diseases, dependent: :destroy
  has_many :dog_diseases, through: :breed_diseases

  validates :name, presence: true, uniqueness: true
end