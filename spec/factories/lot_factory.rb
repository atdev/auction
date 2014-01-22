FactoryGirl.define do
  factory :lot do
    min_bet 10
    time_step 6 #seconds
    status :not_started
  end
end