class GotService
  def house_members(house)
    response = fetch("/api/v1/house/")
    houses_by_id = JSON.parse(response.body, symbolize_names: true)
    house_id = houses_by_id.find{|house_data| house_data[:name] == house.capitalize}[:id]

    response = fetch("/api/v1/house/#{house_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'http://westeros-as-a-service.herokuapp.com') do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.headers['x_api_key'] = ENV['API_KEY']
    end
  end

  def fetch(path)
    conn.get(path)
  end
end
