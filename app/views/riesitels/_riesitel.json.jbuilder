json.extract! riesitel, :id, :meno, :priezvisko, :adresa, :datum_narodenia, :telefon, :telefon_rodic, :email, :created_at, :updated_at
json.url riesitel_url(riesitel, format: :json)