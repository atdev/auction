FactoryGirl.define do
  factory :lot do
    time_step 30 #seconds
    bet_step 10 #seconds
    start_price 30 #seconds
    status :not_started
  end
end