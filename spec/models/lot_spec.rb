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

end
