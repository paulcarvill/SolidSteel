# require 'test_helper'

# class CreateBugsTest < CapybaraTestCase
#   test "can create a new bug" do
#     visit bugs_path
#     click_link "File new bug"
#     assert_equal current_path, new_bug_path

#     fill_in "Title", with: "My new bug"
#     fill_in "Description", with: "Short description."
#     click_button "File bug"
#   end
# end

require 'rails_helper'

RSpec.describe "home page", :type => :request do
  it "displays latest mix" do
    mix = Mix.create!(:name => "foo", :url => "12345")
    visit "/"
    expect(page).to have_selector(".latest-mix iframe")
  end

  DatabaseCleaner.clean
end