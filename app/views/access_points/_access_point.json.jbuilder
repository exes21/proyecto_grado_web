json.extract! access_point, :id, :ip_address, :mac_address, :user, :password, :created_at, :updated_at
json.url access_point_url(access_point, format: :json)
