class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :lot

  after_create :increase_lot_time_end
  after_create :calc_bet_amount
  after_create :reduce_bets_count

  def last_bet_user_for(lot_id)
    Bet.find(lot_id: lot_id).last()
  end
  private
    def increase_lot_time_end
      self.lot.increase_time_end
    end

    def calc_bet_amount
      self.bet_amount = self.lot.increase_current_price
      self.save!
    end

    def reduce_bets_count
      self.user.reduce_bets_count unless self.user.is_admin?
    end
end
