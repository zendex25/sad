json.array!(@professors) do |professor|
  json.extract! professor, :lname, :fname, :mi, :status, :units, :department_id, :user_id
  json.url professor_url(professor, format: :json)
end
