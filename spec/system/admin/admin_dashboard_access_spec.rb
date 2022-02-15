require 'rails_helper'

RSpec.describe 'Admin Dashboard Access', type: :system do
  context 'when the current logged in user is an admin' do
    let(:admin_user) { create(:admin_user) }

    before do
      sign_in(admin_user)
    end

    it 'allows them access to the admin dashboard' do
      visit root_path

      find(:test_id, 'admin-dashboard-link').click

      expect(page).to have_current_path(admin_root_path)
    end
  end

  context 'when the current logged in user is not an admin' do
    let(:user) { create(:user) }

    before do
      sign_in(user)
    end

    it 'does not allow them to access the admin dashboard' do
      visit admin_root_path

      expect(page).not_to have_current_path(admin_root_path)
    end

    it 'redirects them to the root path' do
      visit root_path

      expect(page).to have_current_path(root_path)
    end

    it 'does not show them the link to the admin section in the dashboard menu' do
      visit root_path

      expect(page).not_to have_selector("a[data-test-id='admin-dashboard-link']")
    end

    it 'shows the user a warning message' do
      visit admin_root_path

      expect(find(:test_id, 'flash')).to have_text(/You are not authorised to access this page!/i)
    end
  end
end
