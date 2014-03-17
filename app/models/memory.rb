class Memory < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :favourites, as: :favourable
end
