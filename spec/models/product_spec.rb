require 'spec_helper'

describe Product do
  it { should belong_to(:category) }

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of(:name) }
  it { should ensure_length_of(:name).is_at_least(3).is_at_most(50) }

  it { should validate_presence_of :shop_price }
  it { should validate_numericality_of(:shop_price).only_integer }
  it { should validate_numericality_of(:shop_price).is_greater_than_or_equal_to(1) }

  #it { should validate_presence_of :image }
  #it { should ensure_length_of(:image).is_at_least(5).is_at_most(50) }

  it { should validate_presence_of :description }
  it { should ensure_length_of(:description).is_at_least(5).is_at_most(1000) }

end
