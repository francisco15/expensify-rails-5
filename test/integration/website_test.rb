require 'test_helper'
# https://apotonick.wordpress.com/2015/07/04/minitestspec-capybara-rails-integration-tests-and-cells-it-works/
# http://stackoverflow.com/questions/5655154/how-do-you-perform-javascript-tests-with-minitest-capybara-selenium/13296544#13296544
# https://gist.github.com/zhengjia/428105
class WebsiteTest < ActionDispatch::IntegrationTest
  test "creates an expense" do
    Capybara.current_driver = :webkit
    visit "/expenses"

    click_link "New Expense"
    page.must_have_css(".expense-modal")

    fill_in "Concept", with: "Car"
    fill_in "Amount", with: 50000000
    click_button "Create expense"

    page.must_have_content "was created successfully!"
    page.must_have_content "Car"
  end
end