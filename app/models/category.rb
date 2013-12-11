class Category < ActiveRecord::Base
  validates :name,
            presence: true,
            uniqueness: true,
            length: { in: 2..50 }
  has_ancestry
end
