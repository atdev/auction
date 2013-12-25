class Product < ActiveRecord::Base
  belongs_to :category
  has_many :pictures, as: :imageable

  validates :name, :shop_price, :description, presence: true
  validates :name,
            uniqueness: true,
            length: { in: 3..50 }
  #validates :image, length: { in: 5..50 }
  validates :shop_price, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :description, length: { in: 5..1000 }

  accepts_nested_attributes_for :pictures, allow_destroy: true
end
