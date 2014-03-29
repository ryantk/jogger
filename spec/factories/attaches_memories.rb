# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attaches_memory do
    memory_id 1
    memory_type "MyString"
    has_attachment_id 1
    has_attachment_type "MyString"
  end
end
