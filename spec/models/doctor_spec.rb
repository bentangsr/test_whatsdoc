require 'rails_helper'

RSpec.describe Doctor, type: :model do
  let(:name) { 'doctors' }
  describe 'Associations' do
    # this class belongs to
    it { should have_one(:user) }
  end

  describe 'Attributes' do
    it { should respond_to(:specialist_id) }
    it { should respond_to(:workspace_id) }
    it { should respond_to(:chat_price) }
    it { should respond_to(:phone_price) }
    it { should respond_to(:video_price) }
  end

  describe 'validations' do
    describe 'of presence' do
      # List all attribute that has the validation of presence
      attrs = [
        :specialist_id, :workspace_id
      ]

      attrs.each do |att|
        it { should validate_presence_of(att) }
      end
    end

    describe 'of numericality' do
       attrs = [
        :chat_price, :phone_price, :video_price
      ]
      attrs.each do |att|
        it { is_expected.to validate_numericality_of(att).is_greater_than_or_equal_to(1) }
      end
    end
  end
end
