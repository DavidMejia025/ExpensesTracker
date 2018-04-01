require 'rails_helper'

RSpec.feature "Expenses", type: :feature do

  scenario "create a new expense", js: true do
    ActionMailer::Base.deliveries.clear
    visit  "/expenses"
  end
end
