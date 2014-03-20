class JournalEntry < ActiveRecord::Base
  belongs_to :journal
  has_many :memories, as: :memory_holder
  has_many :tags, as: :taggable

  validates_presence_of :body

  def self.find_by_tag(title)
    joins(:tags).where("tags.title = ?", title)
  end
end
