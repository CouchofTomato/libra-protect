require "rails_helper"

RSpec.describe "User Login" do
  let(:user) { create(:user, email: "dummy@libra.financial") }

  context "with valid credentials" do
    it "logs the user in to their dashboard" do
      visit new_user_session_path

      find(:test_id, "email-field").fill_in with: user.email
      find(:test_id, "password-field").fill_in with: user.password

      find(:test_id, "submit-btn").click

      expect(page).to have_current_path(root_path)
    end
  end

  context "with blank input fields" do
    it "notifies the user one or both of their credentials is invalid" do
      visit new_user_session_path

      find(:test_id, "submit-btn").click
  
      expect(find(:test_id, "flash")).to have_text(/Invalid email or password./i)
    end
  end

  context "with invalid credentials" do
    it "notifies the user that the email is not valid" do
      visit new_user_session_path

      find(:test_id, "email-field").fill_in with: "bob@bob.com"
      find(:test_id, "password-field").fill_in with: user.password

      find(:test_id, "submit-btn").click

      expect(find(:test_id, "flash")).to have_text(/Invalid email or password./i)
    end
  end
end