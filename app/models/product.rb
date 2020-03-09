class Product < ApplicationRecord
  validates :name, :description, presence: true
  validates :price, numericality: { greater_than: 0.0}
end
