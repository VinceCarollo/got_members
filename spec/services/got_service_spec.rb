require "rails_helper"

RSpec.describe GotService do
  it "can get house member data" do
    service = GotService.new

    member_data = service.house_members('stark')

    expect(member_data.first).to have_key(:id)
    expect(member_data.first).to have_key(:name)
    expect(member_data.first).to have_key(:house_id)
    expect(member_data.first).to have_key(:created_at)
    expect(member_data.first).to have_key(:updated_at)
  end
end
