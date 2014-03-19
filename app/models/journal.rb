class Journal < ActiveRecord::Base
  has_many :entries, class_name: "JournalEntry"
  belongs_to :person

  def self.find_by_tag_title(title)
    joins(:tags).where("tags.title = ?", title)
  end
end
