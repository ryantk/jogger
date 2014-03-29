class EntriesController < ApplicationController

  def show
    @entry = current_person.journal_entries.find(params[:id])
  end

  def by_tag 
    @tag = params[:tag]

    @entries = current_person
      .journals
      .find(params[:has_taggables_id])
      .entries
      .joins(:tags)
      .where("tags.title = ?", @tag)

    rescue
      redirect_to controller: :home, action: :index, flash: { error: "No entries with this tag" }
  end

  def new
    @journal = Journal.find(params[:journal_id])
    @entry = JournalEntry.new(journal: @journal)
  end

  def create
    @entry = JournalEntry.new(entry_params)
    @entry.taggings = Tagging.parse(params[:tags])

    if @entry.save
      unless params[:attachment].nil?
        AttachmentAdder.new(@entry).attach_many(params[:attachment].map{|id, _| id.to_i })
      end

      flash[:notice] = "Successfully created a new Journal Entry"
      redirect_to @entry.journal
    else
      flash[:error] = "There were some problems creating your new Journal Entry"
      render :new
    end
  end

  def update
    @entry = current_person.journal_entries.find(params[:id])
    @entry.update_attributes(entry_params)

    if @entry.save
      unless params[:attachment].nil?
        AttachmentAdder.new(@entry).attach_many(params[:attachment].map{|id, _| id.to_i })
      end
      
      flash[:notice] = "Successfully updated your Journal Entry"
      redirect_to @entry.journal
    else
      flash[:error] = "There were some problems updating your Journal Entry"
      render :show
    end
  end

  private

    def entry_params
      params.require(:journal_entry).permit(:body, :journal_id)
    end

end
