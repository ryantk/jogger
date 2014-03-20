FactoryGirl.define do
  factory :comment do
    body "a comment"
  end

  factory :invalid_comment do
    body nil
  end
end
