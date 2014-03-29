class Memory < ActiveRecord::Base
  has_many :attaches_memories, as: :memory

  belongs_to :file, class_name: "FileUpload"
  has_many :comments, as: :commentable
  has_many :favourites, as: :favourable

  def hosted_externally?
    not uploaded
  end

  def tag
    return :audio_tag if self.class.name == "AudioClip"
    return :video_tag if self.class.name == "VideoClip"
    return :image_tag if self.class.name == "Photograph"
  end

  def file_path
    "/memories/#{folder}/#{filename}"
  end

  def attached_to(type)
    attaches_memories.where("has_attachment_type = ?", String(type).camelize).map {|am| am.has_attachment }
  end

  def self.where_attached_to(model)
    AttachesMemory.where(has_attachment: model)
  end

  def delete
    File.delete(Rails.root.join("public", "uploads", "memories", file.name))
    super
  end

  def folder; "memory"; end
end
