class GotService
  def house_members(house)
    house_id = house_id(house)
    response = fetch("/api/v1/house/#{house_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def house_id(house)
    response = fetch("/api/v1/house/")
    houses_by_id = JSON.parse(response.body, symbolize_names: true)
    houses_by_id.find{|house_data| house_data[:name] == house.capitalize}[:id]
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
