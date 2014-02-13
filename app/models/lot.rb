class Lot < ActiveRecord::Base

  belongs_to :product
  has_many :bets
  validates :product_id, :time_step, :bet_step, presence: true
  validates :time_step, numericality: { greater_than_or_equal_to: 30 }

  enum :status, [:not_started, :started, :finished], :allow_nil => true
  after_create :init_lot

  def name
    self.product.name
  end

  def description
    self.product.description
  end

  def category
    self.product.category
  end

  def pictures
    self.product.pictures
  end

  def active?
    if self.status == :started
      true
    else
      false
    end
  end

  def change_for_bet
    self.time_end += self.time_step
    self.current_price += self.bet_step
    self.save!
  end

  def last_bet_user
    if self.bets.count > 0 && self.bets.last.user_id
      User.find(self.bets.last.user_id)
    else
      nil
    end
  end

  private
    def init_time_start
      self.time_start = Time.now
    end

    def init_time_end
      self.time_end = self.time_start + self.time_step
    end

    def init_current_price
      self.current_price = self.start_price
    end

    def init_status
      self.status = :not_started
    end

    def init_lot
      init_time_start
      init_time_end
      init_current_price
      init_status
      self.save!
    end

end
