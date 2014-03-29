module ApplicationHelper

  def flash_style(name)
    {notice: "success", error: "danger", alert: "danger"}[name]
  end

  def label_color(n)
    "label-" << ( n > 0 ? "success" : "default" )
  end

  def label_due_color(due)
    due < Time.now ? "label-warning" : "label-success"
  end

  def glyphicon(klass)
    "<span class='glyphicon glyphicon-#{klass}'></span>".html_safe
  end

  def active_link_to(text, path, tag: :li)
    "<#{tag}{active?}>#{link_to(text, path)}</#{tag}>"
      .gsub("{active?}", current_page?(path) ? ' class="active"': '')
      .html_safe
  end

  def current_breadcrumb(reqpath)
    path = Rails.application.routes.recognize_path(reqpath)
    text = []

    if %w(index by_tag).include? path[:action]
      text << path[:controller].humanize.capitalize
    elsif path[:action] == "show"
      text << "Showing " 
      text << path[:controller].singularize.humanize.capitalize 
      text << request.params[:id]
    else
      text << "New " << path[:controller].singularize
    end

    text.join(" ")
  end

end
