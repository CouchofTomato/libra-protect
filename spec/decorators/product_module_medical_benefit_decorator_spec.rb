require 'rails_helper'

RSpec.describe ProductModuleMedicalBenefitDecorator do
  subject(:decorator) { described_class.new(product_module) }

  let(:product_module) do
    build(:product_module_medical_benefit, benefit_limit:, combined_limits:)
  end
  let(:benefit_limit) { 'unlimited' }
  let(:combined_limits) { 'all inclusive' }

  describe '#benefit_limits' do
    context 'when no options are passed' do
      let(:options) { [] }

      it 'returns the benefit limit' do
        expect(decorator.benefit_limits(options)).to eq('unlimited')
      end
    end

    context 'when combined_limits option is passed' do
      let(:options) { ['combined_limits'] }

      it 'returns the benefit limit and combined limits separated by two newlines' do
        expect(decorator.benefit_limits(options)).to eq("unlimited\n\nall inclusive")
      end
    end

    context 'when module_limits option is passed' do
      let(:options) { ['module_limits'] }

      it 'returns the benefit limit and module limits separated by two newlines' do
        expect(decorator.benefit_limits(options)).to eq("unlimited\n\nUSD 1,000,000 | GBP 600,000 | EUR 750,000")
      end
    end

    context 'when both options are passed' do
      let(:options) { ['combined_limits','module_limits'] }

      it 'returns the benefit limit, combined limits and module limits separated by two newlines' do
        expect(decorator.benefit_limits(options)).to eq(
          "unlimited\n\nall inclusive\n\nUSD 1,000,000 | GBP 600,000 | EUR 750,000"
        )
      end
    end

    context 'when an option is passed but the mapped value is blank' do
      let(:options) { ['combined_limits'] }
      let(:combined_limits) { ''}

      it 'does not include the combined limit or newlines in the output' do
        expect(decorator.benefit_limits(options)).to eq('unlimited')
      end
    end
  end
end