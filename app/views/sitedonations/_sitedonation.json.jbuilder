json.extract! sitedonation, :id, :name, :amount, :email, :tag, :created_at, :updated_at
json.url sitedonation_url(sitedonation, format: :json)
