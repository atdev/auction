require 'spec_helper'

describe Lot do
  
  before do
    category = FactoryGirl.create(:category)
    product = FactoryGirl.create(:product, category_id: category.id)
    @lot = FactoryGirl.create(:lot, product_id: product.id)
  end

  it "should increase time_end" do
    time = Time.now
    @lot.time_end = time
    time += @lot.time_step
    @lot.increase_time_end
    @lot.time_end.should == time
  end

  it "should increase current_price" do
    cp = @lot.current_price
    @lot.increase_current_price
    @lot.current_price.should == cp + @lot.bet_step
  end

  it "#active? false" do
    @lot.status = :not_started
    @lot.is_active.should == false
  end

  it "#active? true" do
    @lot.status = :started
    @lot.is_active.should == true
  end

end
