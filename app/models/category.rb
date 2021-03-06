class Category < ActiveRecord::Base
  has_many :products
  has_one :picture, as: :imageable
  validates :name,
            presence: true,
            uniqueness: true,
            length: { in: 2..50 }
  has_ancestry
  accepts_nested_attributes_for :picture, allow_destroy: true
end
