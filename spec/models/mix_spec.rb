require 'rails_helper'

RSpec.describe Mix, :type => :model do

  it "won't save without a URL" do
  	expect(Mix.new(name: "Foo")).not_to be_valid
  end

  it "returns latest mix" do
    todayMix = Mix.create!(name: "Foo", url: "http://foo")
    yesterdayMix = Mix.create!(name: "Bar", url: "http://bar")
    dayBeforeYesterdayMix = Mix.create!(name: "FooBar", url: "http://foobar")

    expect(Mix.get_latest).to eq(todayMix)
  end
end
