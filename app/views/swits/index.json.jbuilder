json.array!(@swits) do |swit|
  json.extract! swit, :id, :user_id, :content
  json.url swit_url(swit, format: :json)
end
