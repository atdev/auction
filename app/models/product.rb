class Product < ActiveRecord::Base
  belongs_to :category

  validates :name, :shop_price, :image, :description, presence: true
  validates :name,
            uniqueness: true,
            length: { in: 3..50 }
  validates :image, length: { in: 5..50 }
  validates :shop_price, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :description, length: { in: 5..1000 }

end
