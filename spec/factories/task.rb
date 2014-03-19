FactoryGirl.define do
  factory :task do
    due Date.tomorrow
    details "Buy Toothpase"
  end
end
