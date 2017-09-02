json.extract! donation, :id, :name, :amount, :email, :tag, :project_id, :created_at, :updated_at
json.url donation_url(donation, format: :json)
