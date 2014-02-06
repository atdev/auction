class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :lot

  after_create :increase_lot_time_end

  private
    def increase_lot_time_end
      self.lot.increase_time_end
    end
end
