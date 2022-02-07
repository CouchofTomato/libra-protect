require 'rails_helper'

RSpec.describe TemporaryNotificationComponent, type: :component do
  subject(:temporary_notification) { described_class.new(type: type, message: message) }

  context 'with a type of alert' do
    let(:type) { 'alert' }
    let(:message) { '' }

    it 'renders the x_circle_outline alert svg' do
      render_inline(temporary_notification)

      expect(rendered_component).to have_selector("svg[data-test-id='x-circle-outline']")
    end

    it 'renders the alert css' do
      render_inline(temporary_notification)

      expect(rendered_component).to have_css '.text-red-400'
    end
  end

  context 'with a type of notice' do
    let(:type) { 'notice' }
    let(:message) { '' }

    it 'renders the check_circle_outline svg' do
      render_inline(temporary_notification)

      expect(rendered_component).to have_selector("svg[data-test-id='check-circle-outline']")
    end

    it 'renders the alert css' do
      render_inline(temporary_notification)

      expect(rendered_component).to have_css '.text-green-400'
    end
  end
end
