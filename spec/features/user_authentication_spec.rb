require "rails_helper"
Capybara.current_driver = :selenium_chrome

# RSpec.describe "user_authentication", type: :request do
#   describe "authenticate user" do
#   it{
#     get new_user_session_path
#
#     expect(response).to render_template(:new)
#
#     post user_session_path, user:{email:"juan@one.com", password:"123456"}
#     expect(response).to redirect_to(:expenses=> :index)
#     follow_redirect!
#
#   }
#   end
# end

RSpec.describe "the signin process", :type => :feature do

  # User.create(email:"luna@one.com", password:"test1234")
  # Category.create(name:"food")
  # TypeOfTran.create(name:"withdraw")
  # Expense.create(concept:"food", date:06/06/2014, amount:120000, user_id:1)
  #
  # it "signs me in" do
  #   visit new_user_session_path
  #
  #   fill_in "user_email", with: "luna@one.com"
  #   fill_in "user_password", with: "test1234"
  #   sleep 5
  #   find('input[type="submit"]').click
  #   sleep 10
  #   expect(current_path).to eq root_path
  # end

  it "Create expense" do

    visit expenses_path

    fill_in "user_email", with: "luna@one.com"
    fill_in "user_password", with: "test1234"
    sleep 5
    find('input[type="submit"]').click
    sleep 5
    visit expenses_path
    sleep 5

    find('button[type="button"]').click

  end
end
