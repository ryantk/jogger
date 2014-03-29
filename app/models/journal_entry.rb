class JournalEntry < ActiveRecord::Base
  belongs_to :journal
  
  has_many :attaches_memories, as: :has_attachment
  has_many :memories, through: :attaches_memories, source_type: "Memory"
  
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings

  validates_presence_of :body

  def self.find_by_tag(title)
    joins(:tags).where("tags.title = ?", title)
  end

  def taggable
    journal
  end

  def attach(memory)
    AttachesMemory.create(has_attachment: self, memory: memory)
  end
end
