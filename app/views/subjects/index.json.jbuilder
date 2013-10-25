json.array!(@subjects) do |subject|
  json.extract! subject, :name, :desc, :units, :department_id
  json.url subject_url(subject, format: :json)
end
