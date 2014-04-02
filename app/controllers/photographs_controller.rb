class PhotographsController < ApplicationController

  def create
    @file = FileUpload.create_from_params(params[:photograph][:file])
    @photograph = current_person.photographs.new(file: @file)
    if @photograph.save
      redirect_to :back, flash: { notice: "Successfully Saved Photograph" }
    else
      redirect_to :back, flash: { error: "Could not save Photograph!" }
    end
  end

  def index
    @photographs = current_person.photographs
  end

  def destroy
    @photograph = current_person.photographs.find(params[:id])

    if @photograph.delete 
      redirect_to :back, flash: { notice: "Successfully Deleted photograph" }
    else
      redirect_to :back, flash: { error: "Could not delete photograph!" }
    end
  end

end
