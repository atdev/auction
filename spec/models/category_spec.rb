require 'spec_helper'

describe Category do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of(:name) }
  it { should ensure_length_of(:name).is_at_least(2).is_at_most(50) }

  it { should have_many(:products) }

end
