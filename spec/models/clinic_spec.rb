require 'rails_helper'

RSpec.describe Clinic, type: :model do
  let(:name) { 'clinics' }
  describe 'Associations' do
    # this class belongs to
    it { should belong_to(:user) }
  end

  describe 'Attributes' do
    it { should respond_to(:user_id) }
    it { should respond_to(:name) }
    it { should respond_to(:address) }
    it { should respond_to(:phone) }
    it { should respond_to(:email) }
  end

  describe 'validations' do
    describe 'of presence' do
      # List all attribute that has the validation of presence
      attrs = [
        :email, :user_id, :name
      ]

      attrs.each do |att|
        it { should validate_presence_of(att) }
      end
    end

    describe 'of uniqueness' do
      # List all attribute that has the validation of uniqueness
      attrs = [
        :email
      ]

      attrs.each do |att|
        it { should validate_uniqueness_of(att) }
      end
    end
  end
end
