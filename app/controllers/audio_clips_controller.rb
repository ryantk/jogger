class AudioClipsController < ApplicationController

  def create
    @file = FileUpload.create_from_params(params[:audio_clip][:file])
    @audio = current_person.audio_clips.new(file: @file)
    
    if @audio.save
      redirect_to :back, flash: { notice: "Successfully Saved Audio" }
    else
      redirect_to :back, flash: { error: "Could not save Audio!" }
    end
  end

  def index
    @audio_clips = current_person.audio_clips
  end

  def destroy
    @audio_clip = current_person.audio_clips.find(params[:id])

    if @audio_clip.delete 
      redirect_to :back, flash: { notice: "Successfully Deleted Audio" }
    else
      redirect_to :back, flash: { error: "Could not delete Audio!" }
    end
  end


end
