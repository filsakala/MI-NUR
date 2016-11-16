json.extract! komentar, :id, :autor, :text, :created_at, :updated_at
json.url komentar_url(komentar, format: :json)