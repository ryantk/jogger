class Memory < ActiveRecord::Base
  belongs_to :memory_holder, polymorphic: true
  has_many :comments, as: :commentable
  has_many :favourites, as: :favourable

  def hosted_externally?
    not uploaded
  end

  def file_path
    "/memories/#{folder}/#{filename}"
  end

  def folder; "memory"; end
end
