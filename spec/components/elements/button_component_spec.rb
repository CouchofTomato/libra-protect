# frozen_string_literal: true

require "rails_helper"

RSpec.describe Elements::ButtonComponent, type: :component do
  context "when rendering a button with the default options" do
    subject(:button_component) { described_class.new }

    it "renders the primary button type classes" do
      render_inline(button_component)

      expect(rendered_component).to have_css ".bg-orange-600"
    end

    it "has a blank formmethod" do
      render_inline(button_component)

      expect(rendered_component).to have_css "button[formmethod='']"
    end

    it "has a blank formaction" do
      render_inline(button_component)

      expect(rendered_component).to have_css "button[formaction='']"
    end
  end

  context "when rendering a button with the secondary type" do
    subject(:button_component) { described_class.new(type: type) }

    let(:type) { :secondary }

    it "renders the secondary button type classes" do
      render_inline(button_component)

      expect(rendered_component).to have_css ".bg-persian-blue-50"
    end
  end

  context "when rendering a button with the width set to full" do
    subject(:button_component) { described_class.new(width: width) }

    let(:width) { :full }

    it "renders with the full width class" do
      render_inline(button_component)

      expect(rendered_component).to have_css ".w-full"
    end
  end

  context "when rendering a button without setting the width to full" do
    subject(:button_component) { described_class.new }

    it "does not add the full width class" do
      render_inline(button_component)

      expect(rendered_component).not_to have_css ".w-full"
    end
  end

  context "when data attributes are passed in" do
    subject(:button_component) { described_class.new(data_attributes: data_attributes) }

    let(:data_attributes) { { controller: "navbar", navbar_target: "menu_state" } }

    it "renders a div with the data attributes parsed to be html valid" do 
      render_inline(button_component)
  
      expect(rendered_component).to have_css("button[data-controller='navbar'][data-navbar-target='menu-state']")
    end
  end
end
