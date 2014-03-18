class Task < ActiveRecord::Base
  belongs_to :schedule
  has_many :tags, as: :taggable
end
