class TailwindFormBuilder < ActionView::Helpers::FormBuilder
  # rubocop:disable Layout/LineLength
  ELEMENT_CLASS_MAPPINGS = {
    check_box:
      'focus:ring-orange-500 h-4 w-4 text-orange-600 border-gray-300 rounded',
    input:
      'appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-orange-500 focus:border-orange-500 sm:text-sm',
    label:
      'block text-sm font-medium text-gray-700',
    select:
      'mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md',
    collection_radio_buttons:
      'focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-gray-300',
      submit_button:
      'w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-orange-400 hover:bg-orange-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-orange-300'
  }.freeze

  # rubocop:enable Layout/LineLength

  def label(method, text = nil, options = {}, &block)
    super(
      method,
      text,
      options.reverse_merge(class: ELEMENT_CLASS_MAPPINGS.fetch(:label)),
      &block
    )
  end

  def email_field(method, options = {})
    super(
      method,
      options.reverse_merge(class: ELEMENT_CLASS_MAPPINGS.fetch(:input))
    )
  end

  def password_field(method, options = {})
    super(
      method,
      options.reverse_merge(class: ELEMENT_CLASS_MAPPINGS.fetch(:input))
    )
  end

  def check_box(
    method,
    options = {},
    checked_value = '1',
    unchecked_value = '0'
  )
    super(
      method,
      options.reverse_merge(class: ELEMENT_CLASS_MAPPINGS.fetch(:check_box)),
      checked_value,
      unchecked_value
    )
  end

  def select(method, choices = nil, options = {}, html_options = {}, &block)
    super(
      method,
      choices,
      options,
      html_options.reverse_merge(class: ELEMENT_CLASS_MAPPINGS.fetch(:select)),
      &block
    )
  end

  def collection_radio_buttons(method, collection, value_method, text_method, options = {}, html_options = {}, &block)
    super(
      method,
      collection,
      value_method,
      text_method,
      options,
      html_options.reverse_merge(class: ELEMENT_CLASS_MAPPINGS.fetch(:collection_radio_buttons)),
      &block
    )
  end

  def submit(value = nil, options = {})
    super(
      value,
      options.reverse_merge(class: ELEMENT_CLASS_MAPPINGS.fetch(:submit_button))
    )
  end
end
