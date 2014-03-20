FactoryGirl.define do
  factory :person do
    email "test@email.com"
    password "password"

    after(:build) {|p| p.email = "#{p.email}x" }
  end
end
