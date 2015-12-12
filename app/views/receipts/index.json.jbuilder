json.array!(@receipts) do |receipt|
  json.extract! receipt, :id, :client_id, :person_id, :description, :total_amount, :emission_date
  json.url receipt_url(receipt, format: :json)
end
