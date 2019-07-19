class MemberSearchFacade

  def initialize(house)
    @house = house
  end

  def members
    @members ||= service.house_members(house).map do |member_data|
      Member.new(member_data)
    end
  end

  def member_count
    members.count
  end

  private

  def service
    GotService.new
  end

  attr_reader :house
end
