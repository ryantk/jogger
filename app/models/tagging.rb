class Tagging < ActiveRecord::Base

  belongs_to :taggable, polymorphic: true
  belongs_to :tag

  def self.parse(tags)
    tags.strip.split(",").map {|t| new(tag: Tag.find_or_create_by(title: t)) }
  end
end
