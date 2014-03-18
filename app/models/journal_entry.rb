class JournalEntry < ActiveRecord::Base
  belongs_to :journal
  has_many :memories, as: :memory_holder
  has_many :tags, as: :taggable
end
