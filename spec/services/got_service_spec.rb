require "rails_helper"

RSpec.describe GotService do
  it "can get house member data" do
    service = GotService.new

    member_data = service.house_members('stark')
    expect(member_data.first).to have_key(:id)
    expect(member_data.first).to have_key(:name)
  end
end
