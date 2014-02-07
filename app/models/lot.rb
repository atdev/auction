class Lot < ActiveRecord::Base

  belongs_to :product
  has_many :bets
  validates :product_id, :min_bet, :time_step, :bet_step, presence: true
  validates :min_bet, numericality: { greater_than_or_equal_to: 1 }
  validates :time_step, numericality: { greater_than_or_equal_to: 30 }

  enum :status, [:not_started, :started, :finished]
  #after_create :init_time_end
  def name
    self.product.name
  end

  def category
    self.product.category
  end

  def pictures
    self.product.pictures
  end

  def increase_time_end
    self.time_end += self.time_step
    self.save!
  end

  protected
    #def init_time_end
    #
    #end
end
