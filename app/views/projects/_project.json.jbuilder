json.extract! project, :id, :name, :description, :source_link, :complete_link, :image, :active, :created_at, :updated_at
json.url project_url(project, format: :json)