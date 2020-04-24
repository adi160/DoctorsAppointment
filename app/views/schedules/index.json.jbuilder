json.array! @schedules do |schedule|
  json.id schedule.id
  json.start schedule.start
  json.end schedule.end
  # json.update_url event_path(event, method: :patch)
  # json.edit_url edit_event_path(event)
end