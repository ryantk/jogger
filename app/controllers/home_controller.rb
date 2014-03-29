class HomeController < ApplicationController
  def index
    redirect_to new_person_session_path unless person_signed_in?
  end
end
