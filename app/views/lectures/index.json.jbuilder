json.array!(@lectures) do |lecture|
  json.extract! lecture, :id, :day, :time
  json.url lecture_url(lecture, format: :json)
end
