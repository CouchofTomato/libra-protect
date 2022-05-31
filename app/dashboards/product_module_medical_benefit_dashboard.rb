require "administrate/base_dashboard"

class ProductModuleMedicalBenefitDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    product_module: Field::BelongsTo,
    medical_benefit: Field::BelongsTo,
    id: Field::Number,
    benefit_limit: Field::String,
    benefit_limit_status: Field::Select.with_options(searchable: false, collection: ->(field) {
 field.resource.class.send(field.attribute.to_s.pluralize).keys }),
    benefit_weighting: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    product_module
    medical_benefit
    benefit_limit
    benefit_limit_status
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    product_module
    medical_benefit
    id
    benefit_limit
    benefit_limit_status
    benefit_weighting
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    product_module
    medical_benefit
    benefit_limit
    benefit_limit_status
    benefit_weighting
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how product module medical benefits are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(product_module_medical_benefit)
    "#{product_module_medical_benefit.product_module.name} : #{product_module_medical_benefit.medical_benefit.name}"
  end
end
