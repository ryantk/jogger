class Task < ActiveRecord::Base
  belongs_to :user
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings

  has_many :attaches_memories, as: :has_attachment
  has_many :memories, through: :attaches_memories, source_type: "Memory"

  validates_presence_of :details

  def self.find_by_tag(title)
    joins(:tags).where("tags.title = ?", title)
  end

  def attach_many(ids)
    AttachesMemory.attach_to(self, ids)
  end

  def attach(memory)
    AttachesMemory.find_or_create_by(has_attachment: self, memory: memory)
  end
end
