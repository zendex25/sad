json.array!(@professors) do |professor|
  json.extract! professor, :lname, :fname, :mi, :status, :units
  json.url professor_url(professor, format: :json)
end
