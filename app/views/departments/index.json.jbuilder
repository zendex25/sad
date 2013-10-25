json.array!(@departments) do |department|
  json.extract! department, :name, :desc, :chair_id
  json.url department_url(department, format: :json)
end
