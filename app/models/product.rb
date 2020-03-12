class Product < ApplicationRecord
  validates :name, :description, presence: true
  validates :price, numericality: { 
    greater_than: 0.0
  }
  validates :quantity, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }


  belongs_to :user
  
  #add dependent destroy so when product is deleted,
  # its corresponding comments will be deleted as well
  has_many :comments, dependent :destoy

  def owned_by?(owner) 
    user == owner
  end
end
