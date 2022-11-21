require 'rails_helper'

RSpec.describe Specialist, type: :model do
  let(:name) { 'specialists' }
  describe 'Associations' do
    # this class belongs to
    it { should have_many(:doctors) }
  end

  describe 'Attributes' do
    it { should respond_to(:name) }
    it { should respond_to(:code) }
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
