json.array!(@schedules) do |schedule|
  json.extract! schedule, :section_id, :subject_id, :start_time, :time, :finish_time, :time, :professor_id, :room_id, :day_id
  json.url schedule_url(schedule, format: :json)
end
