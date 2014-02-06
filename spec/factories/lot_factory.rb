FactoryGirl.define do
  factory :lot do
    min_bet 20
    time_step 30 #seconds
    bet_step 10 #seconds

    status :not_started
  end
end