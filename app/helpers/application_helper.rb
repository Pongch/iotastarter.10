module ApplicationHelper
  def title(project_title)
    content_for(:title) do project_title end
  end

  def meta_description(project_text)
    content_for(:meta_description) { project_text }
  end

  def project_completion()
    #(@donations.approved.sum(:amount) / @project.total.to_f) * 100
    (@show_balance/@project.total.to_f) * 100
  end

  

end
