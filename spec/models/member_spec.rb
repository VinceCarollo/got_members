require "rails_helper"

RSpec.describe Member do

  before :each do
    @member = Member.new({
        id: 10,
        name: 'Arya'
      })
  end

  it "exists" do
    expect(@member).to be_a Member
  end

  it "has attributes" do
    expect(@member.id).to eq(10)
    expect(@member.name).to eq('Arya')
  end
end
