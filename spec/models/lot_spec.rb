require 'spec_helper'

describe Lot do
  
  before do
    category = FactoryGirl.create(:category)
    product = FactoryGirl.create(:product, category_id: category.id)
    FactoryGirl.create(:lot, product_id: product.id)
  end

  it "should increase time_end" do
    lot = Lot.first
    lot.time_step = 30
    time = Time.now
    lot.time_end = time
    bet = Bet.new(lot_id: lot.id)
    time += 30
    bet.save
    expect(lot.time_end).eq (time)
  end

end
