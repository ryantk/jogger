class Tag < ActiveRecord::Base
  belongs_to :taggable, polymorphic: true

  validates_presence_of :title
end
