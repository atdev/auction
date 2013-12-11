class Category < ActiveRecord::Base
  validates :name,
            presence: true,
            uniqueness: true,
            length: { in: 4..50 }

end
