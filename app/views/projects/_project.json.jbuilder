json.extract! project, :id, :title, :description, :owner, :total, :category, :created_at, :updated_at
json.url project_url(project, format: :json)
