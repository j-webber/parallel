json.extract! parking_pass, :id, :expiration_date, :qr_code, :valid_days, :guest_id, :created_at, :updated_at
json.url parking_pass_url(parking_pass, format: :json)
