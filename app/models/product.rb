class Product < ActiveRecord::Base
  belongs_to :category

  validates_numericality_of :price
  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
end
