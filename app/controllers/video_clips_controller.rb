class VideoClipsController < ApplicationController

  def create
    @file = FileUpload.create_from_params(params[:video_clip][:file])
    @video = current_person.video_clips.new(file: @file)
    
    if @video.save
      redirect_to :back, flash: { notice: "Successfully Saved Video" }
    else
      redirect_to :back, flash: { error: "Could not save Video!" }
    end
  end

  def index
    @video_clips = current_person.video_clips
  end

end
