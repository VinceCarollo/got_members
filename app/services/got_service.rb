class GotService
  def house_members(house)
    conn = Faraday.new(url: 'https://westerosapi.herokuapp.com') do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params['api_key'] = ENV['API_KEY']
    end

    response = conn.get("/api/v1/house/#{house}")
    member_data = JSON.parse(response.body, symbolize_names: true)
    member_data[:data].first[:attributes][:members]
  end
end
