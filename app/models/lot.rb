class Lot < ActiveRecord::Base

  belongs_to :product
  has_many :bets
  validates :product_id, :time_step, :bet_step, presence: true
  validates :time_step, numericality: { greater_than_or_equal_to: 30 }

  enum :status, [:not_started, :started, :finished]
  after_create :init_current_price

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

  def increase_current_price
    self.current_price += self.bet_step
    if self.save!
      self.current_price
    else
      false
    end
  end

  def last_bet_user
    if self.bets.count > 0 && self.bets.last.user_id
      User.find(self.bets.last.user_id)
    else
      nil
    end
  end

  private
    def init_time_end
      self.time_end = self.time_start + self.time_step
    end

    def init_current_price
      self.current_price = self.start_price
      self.save!
    end

end
