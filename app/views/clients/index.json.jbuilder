json.array!(@clients) do |client|
  json.extract! client, :id, :first_name, :last_name, :birth_date, :gender, :document_number, :cuit, :email, :phone_number, :skype
  json.url client_url(client, format: :json)
end
