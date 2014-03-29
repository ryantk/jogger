module TasksHelper

  def task_complete_btn_class(complete)
    "btn " << (complete ? "btn-default active" : "btn-success")
  end
end
