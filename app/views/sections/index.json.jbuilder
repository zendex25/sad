json.array!(@sections) do |section|
  json.extract! section, :name, :department_id, :yearlevel
  json.url section_url(section, format: :json)
end
