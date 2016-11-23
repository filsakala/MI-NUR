json.extract! organizator, :id, :meno, :priezvisko, :nick, :status, :email, :telefon, :created_at, :updated_at
json.url organizator_url(organizator, format: :json)