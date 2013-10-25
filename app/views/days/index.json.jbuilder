json.array!(@days) do |day|
  json.extract! day, :name, :desc
  json.url day_url(day, format: :json)
end
