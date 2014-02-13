class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :lot

  after_create :reduce_bets_count
  after_create :change_lot_for_bet
  after_create :fetch_current_price

  private
    def change_lot_for_bet
      self.lot.change_for_bet
    end

    def fetch_current_price
      self.bet_amount = self.lot.current_price
      self.save!
    end

    def reduce_bets_count
      self.user.reduce_bets_count unless self.user.is_admin?
    end
end
