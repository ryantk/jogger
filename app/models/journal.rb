class Journal < ActiveRecord::Base
  has_many :entries, class_name: "JournalEntry"
end
