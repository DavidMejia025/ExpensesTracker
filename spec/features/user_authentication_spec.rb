require "rails_helper"
Capybara.current_driver = :selenium_chrome


RSpec.describe "the signin process", :type => :feature do

  User.create(email:"luna@one.com", password:"test1234")
  Category.create(name:"food")
  TypeOfTran.create(name:"withdraw")
  #Expense.create(concept:"food", date:"06/06/2017", amount:120000, user_id:1)
  
  # it "signs me in" do
  #   visit new_user_session_path

  #   fill_in "user_email", with: "luna@one.com"
  #   fill_in "user_password", with: "test1234"
  #   find('input[type="submit"]').click
  #   expect(current_path).to eq root_path
  # end
 it "Create expense" do
    visit expenses_path
    fill_in "user_email", with: "luna@one.com"
    fill_in "user_password", with: "test1234"
    find('input[type="submit"]').click
    visit expenses_path
    find('button.btn.btn-success.pull-left').click
    select "2018", :from => "expense_date_1i"
    select "April", :from => "expense_date_2i"
    select "2", :from => "expense_date_3i"
    type_of_tran_id = TypeOfTran.last.id
    within '#expense_type_of_tran_id' do
      find("option[value='#{type_of_tran_id}']").click
    end
    cat_id = Category.last.id
    within '#expense_category_id' do
      find("option[value='#{cat_id}']").click
    end
    fill_in "expense_concept", with: "Fish"
    fill_in "expense_amount", with: 25000
    sleep 2
    find('input[type="submit"]').click
    sleep 5
  end
end
