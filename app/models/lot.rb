class Lot < ActiveRecord::Base
  belongs_to :product
  validates :product_id, :min_bet, :time_step, presence: true
  validates :min_bet, numericality: { greater_than_or_equal_to: 1 }
  validates :time_step, numericality: { greater_than_or_equal_to: 5 }

  enum :status, [:not_started, :started, :finished]

  def name
    self.product.name
  end

  def category
    self.product.category
  end

  def pictures
    self.product.pictures
  end
end
