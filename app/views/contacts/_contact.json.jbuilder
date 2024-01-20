json.extract! contact, :id, :email_address, :first_name, :last_name, :nick, :age, :created_at, :updated_at
json.url contact_url(contact, format: :json)
