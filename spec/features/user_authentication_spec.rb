require "rails_helper"


RSpec.describe "user_authentication", type: :request do
  describe "authenticate user" do
  it{
    get new_user_session_path
    expect(response).to render_template(:new)

    post user_session_path, user:{email:"juan@one.com", password:"123456"}
    expect(response).to redirect_to(:expenses=> :index)
    follow_redirect!

  }
end


  end