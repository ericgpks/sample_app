require "rails_helper"

RSpec.describe "users login" do
  describe "login with invalid information" do
    it "should flash danger" do
      get login_path
      expect(flash.empty?).to be(true)
      post login_path, params: { session: { email: "", password: "" } }
      expect(flash.empty?).to be(false)
      get root_path
      expect(flash.empty?).to be(true)
    end
  end

  describe "login with valid information" do
    let(:user) { create(:user) }
    it "should login user" do
      get login_path
      post login_path, params: { session: { email: user.email, password: user.password } }
      expect(redirect_to(user))
      expect(session[:user_id]).to eq(user.id)
    end
  end

  describe "login with valid email and invalid password" do
    let(:user) { create(:user) }
    it "should not login user" do
      get login_path
      post login_path, params: { session: { email: user.email, password: "invalidpassword" } }
      expect(response.status).to eq(422)
      expect(flash.empty?).to be(false)
      expect(session[:user_id]).to be(nil)
      get root_path
      expect(flash.empty?).to be(true)
    end
  end

  describe "login with valid information followed by logout" do
    let(:user) { create(:user) }
    it "should login and log out" do
      post login_path, params: { session: { email: user.email, password: user.password } }
      expect(redirect_to(user))
      follow_redirect!
      expect(session[:user_id]).to eq(user.id)

      delete logout_path
      expect(response.status).to eq(303)
      expect(session[:user_id]).to be(nil)
      expect(redirect_to(root_url))
      follow_redirect!
    end
  end
end
