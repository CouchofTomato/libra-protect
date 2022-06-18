# frozen_string_literal: true

class TabMenuComponent < ViewComponent::Base
  def initialize(iterator:, selected_tab:)
    @iterator = iterator
    @selected_tab = selected_tab
  end

  private

  attr_reader :iterator, :selected_tab
  
  def tab_classes(category)
    if selected_tab == category
      "border-indigo-500 text-indigo-600"
    else
      "border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300"
    end
  end
end
