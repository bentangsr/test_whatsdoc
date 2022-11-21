require 'rails_helper'

RSpec.describe Country, type: :model do
  let(:name) { 'countries' }

  describe 'Attributes' do
    it { should respond_to(:code) }
    it { should respond_to(:name) }
  end

  describe 'validations' do
    describe 'of presence' do
      # List all attribute that has the validation of presence
      attrs = [
        :code, :name
      ]

      attrs.each do |att|
        it { should validate_presence_of(att) }
      end
    end

    describe 'of uniqueness' do
      # List all attribute that has the validation of uniqueness
      attrs = [
        :code
      ]

      attrs.each do |att|
        it { should validate_uniqueness_of(att) }
      end
    end
  end
end
