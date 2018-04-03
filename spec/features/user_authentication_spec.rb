require "rails_helper"


RSpec.describe "user_authentication", type: :request do
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