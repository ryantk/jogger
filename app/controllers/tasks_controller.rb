class TasksController < ApplicationController

  def new
    @task = current_person.tasks.new
  end

  def create
    @task = current_person.tasks.new(task_params)
    @task.taggings = Tagging.parse(params[:tags])

    if @task.save
      unless params[:attachment].nil?
        AttachmentAdder.new(@task).attach_many(params[:attachment].map{|id, _| id.to_i })
      end
      
      flash[:notice] = "Successfully created a new Task"
      redirect_to tasks_path
    else
      flash[:error] = "There were some problems creating your new Task"
      render :new
    end
  end

  def index
    @tasks = current_person.tasks
  end

  def show
    @task = current_person.tasks.find(params[:id])
  end

  def by_tag
    @tasks = current_person.tasks.joins(:taggings, :tags).where("tags.title = ?", params[:tag]).uniq
    render :index
  end

  def update
    @task = current_person.tasks.find(params[:id])
    @task.update_attributes(task_params)

    if @task.save
      unless params[:attachment].nil?
        AttachmentAdder.new(@task).attach_many(params[:attachment].map{|id, _| id.to_i })
      end
      
      redirect_to :back, flash: { notice: "Successfully Updated Task" }
    else
      redirect_to :back, flash: { error: "Could not update Task!" }
    end
  end

  private

    def task_params
      params.require(:task).permit(:due, :details, :tags, :complete)
    end

end
