require 'rails_helper'

RSpec.describe MemberSearchFacade do

  before :each do
    @facade = MemberSearchFacade.new('stark')
  end

  it "gets members of house" do
    members = @facade.members

    expect(members.first).to be_a Member
    expect(members.first).to have_attributes(id: 1, name: "Rickard Stark")
  end

  it "gets member count of house" do
    count = @facade.member_count

    expect(count).to eq(11)
  end
end
