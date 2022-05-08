# frozen_string_literal: true

module Elements
  class ButtonComponent < ViewComponent::Base
    def initialize(type: :primary, formmethod: nil, formaction: nil, width: nil, data_attributes: {})
      @type = type
      @width = width
      @data_attributes = data_attributes
      @formmethod = formmethod
      @formaction = formaction
    end

    def classes
      type_classes.concat(width_classes)
        .join(" ")
    end

    # rubocop:disable Layout/LineLength
    def type_classes
      case @type
      when :primary
        %w[inline-flex items-center px-1 py-1 border border-transparent text-sm justify-center font-medium rounded-md 
shadow-sm text-white bg-orange-600 hover:bg-orange-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-orange-500]
      when :secondary
        %w[inline-flex items-center px-1 py-1 border border-transparent text-sm justify-center font-medium rounded-md 
text-persian-blue-700 bg-persian-blue-50 hover:bg-persian-blue-100 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-persian-blue-500]
      end
    end
    # rubocop:enable Layout/LineLength

    def width_classes
      case @width
      when :full
        %w[w-full]
      else
        []
      end
    end

    def data_attributes
      @data_attributes
        .map { |key, value| "data-#{key.to_s.dasherize}=#{value.to_s.dasherize}" }
        .join(" ")
    end
  end
end
