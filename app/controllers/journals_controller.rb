class JournalsController < ApplicationController

  def index
    @journals = current_person.journals
  end

  def show
    @journal = current_person.journals.find(params[:id])
  end

  def new
    @journal = current_person.journals.new
  end

  def create
    @journal = current_person.journals.new(journal_params)
    if @journal.save
      flash[:notice] = "Successfully created a new Journal"
      redirect_to @journal
    else
      flash[:error] = "There were some problems creating your new Journal"
      render :new
    end
  end

  def update
    @journal = current_person.journals.find(params[:id])
    @journal.update_attributes(journal_params)
    if @journal.save
      flash[:notice] = "Successfully updated your Journal"
      redirect_to @journal
    else
      flash[:error] = "There were some problems updating your Journal"
      render :show
    end
  end

  private

    def journal_params
      params.require(:journal).permit(:title)
    end

end
