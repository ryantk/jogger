class Task < ActiveRecord::Base
  belongs_to :schedule
  has_many :tags, as: :taggable

  def self.find_by_tag(title)
    joins(:tags).where("tags.title = ?", title)
  end
end
