class MemberSearchFacade

  def initialize(house)
    @house = house
  end

  def members
    conn = Faraday.new(url: 'https://westerosapi.herokuapp.com') do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params['api_key'] = ENV['API_KEY']
    end

    response = conn.get("/api/v1/house/#{house}")

    members_data = JSON.parse(response.body, symbolize_names: true)

    members_data[:data].first[:attributes][:members].map do |member_data|
      Member.new(member_data)
    end
  end

  def member_count
    members.length
  end

  private

  attr_reader :house
end
