require 'rails_helper'

RSpec.describe Workspace, type: :model do
  let(:name) { 'workspaces' }
  describe 'Associations' do
    # this class belongs to
    it { should belong_to(:country) }
    it { should have_many(:doctors) }
  end

  describe 'Attributes' do
    it { should respond_to(:name) }
    it { should respond_to(:code) }
    it { should respond_to(:address) }
    it { should respond_to(:country_id) }
  end

  describe 'validations' do
    describe 'of presence' do
      # List all attribute that has the validation of presence
      attrs = [
        :code, :name, :country_id
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
