require "rails_helper"
Capybara.current_driver = :selenium_chrome

RSpec.describe "user_authentication", type: :request do
   #User.create(email:"juan@one.com", password:"123456")
   User.create(email:"luna@one.com", password:"test1234")
   #Category.create(name:"food")
   #TypeOfTran.create(name:"withdraw")
  # Expense.create(concept:"food", date:06/06/2014, amount:120000, user_id:1)

  describe "authenticate user" do
    it "log in" do
      get new_user_session_path
      expect(response).to render_template(:new)
      post user_session_path, user:{email:"juan@one.com", password:"123456"}
      expect(response).to redirect_to(root_path)
      follow_redirect! 
      expect(response).to render_template(:index)
    end

    it "test expenses path" do
      get new_user_session_path
      expect(response).to render_template(:new)
      post user_session_path, user:{email:"juan@one.com", password:"123456"}
      expect(response).to redirect_to(root_path)
      follow_redirect!
      expect(response).to render_template(:index)
      get expenses_path
      
    end
  end
end