FactoryGirl.define do
  factory :journal_entry do
    body "an example body of text"
    association :journal
    tags { build_list :tag, 3 }
    memories { build_list :memory, 3 }
  end
end
