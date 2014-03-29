class AttachmentAdder

  def initialize(model)
    @model = model
  end

  def attach_many(ids)
    AttachesMemory.attach_to(@model, ids)
  end

  def attach(memory)
    AttachesMemory.find_or_create_by(has_attachment: @model, memory: memory)
  end

end