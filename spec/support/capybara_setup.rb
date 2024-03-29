Capybara.default_max_wait_time = 10

# Normalize whitespaces when using `has_text?` and similar matchers,
# i.e., ignore newlines, trailing spaces, etc.
# That makes tests less dependent on slightly UI changes.
Capybara.default_normalize_ws = true

Capybara.save_path = File.expand_path(ENV.fetch('CAPYBARA_ARTIFACTS', './tmp/capybara'))

Capybara.singleton_class.prepend(
  Module.new do
    attr_accessor :last_used_session

    def using_session(name, &)
      self.last_used_session = name
      super
    ensure
      self.last_used_session = nil
    end
  end
)

Capybara.add_selector(:test_id) do
  css { |value| "[data-test-id='#{value}']" }
end