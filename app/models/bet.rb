class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :lot

  after_create :increase_lot_time_end
  after_create :calc_bet_amount

  private
    def increase_lot_time_end
      self.lot.increase_time_end
    end

    def calc_bet_amount
      self.bet_amount = self.lot.update_current_price
      self.save!
    end
end
