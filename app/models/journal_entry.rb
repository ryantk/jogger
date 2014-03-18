class JournalEntry < ActiveRecord::Base
  belongs_to :journal
  has_many :memories, as: :memory_holder
end
