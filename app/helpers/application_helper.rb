module ApplicationHelper
  def title(project_title)
  content_for(:title) { project_title }
end

def meta_description(project_text)
  content_for(:meta_description) { project_text }
end
end
