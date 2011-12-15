require 'test_helper'

class AjaxSearchTest < ActionController::IntegrationTest
  include Capybara::DSL

  fixtures :all

  test "search pares down results without completely refreshing the page" do
    Capybara.using_driver(Capybara.javascript_driver) do
      visit root_path

      fill_in "search", :with => "Settler"

      assert page.has_content?("Settlers of Catan")

      # Not the same thing!
      # assert !page.has_content?("Pass the Pigs")
      assert page.has_no_content?("Pass the Pigs")
    end
  end
end
