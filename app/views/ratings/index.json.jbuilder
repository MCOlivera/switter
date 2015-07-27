json.array!(@ratings) do |rating|
  json.extract! rating, :id, :swit_id, :user_id, :rate
  json.url rating_url(rating, format: :json)
end
