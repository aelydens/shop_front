class Product < ActiveRecord::Base
  belongs_to :category
  has_many :order_items

  validates_numericality_of :price
  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
end
