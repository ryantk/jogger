class Memory < ActiveRecord::Base
  belongs_to :memory_holder, polymorphic: true
  has_many :comments, as: :commentable
  has_many :favourites, as: :favourable
end
