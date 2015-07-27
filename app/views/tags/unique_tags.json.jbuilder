json.array!(@tags) do |tag|
  json.extract! tag, :id, :swit_id, :content
  json.url tag_url(tag, format: :json)
end
