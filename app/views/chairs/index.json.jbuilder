json.array!(@chairs) do |chair|
  json.extract! chair, :lname, :fname, :mi, :department_id
  json.url chair_url(chair, format: :json)
end
