class AttachesMemory < ActiveRecord::Base

  belongs_to :has_attachment, polymorphic: true
  belongs_to :memory, polymorphic: true

  def self.attach_to(model, memory_ids)
    delete_all("has_attachment_id = #{model.id}")
    memory_ids.each {|id| create(has_attachment: model, memory: Memory.find(id)) }
  end

end
