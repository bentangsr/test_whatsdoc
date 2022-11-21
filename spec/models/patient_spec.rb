require 'rails_helper'

RSpec.describe Patient, type: :model do
  let(:name) { 'patients' }
  describe 'Associations' do
    # this class belongs to
    it { should have_one(:user) }
  end

  describe 'Attributes' do
    it { should respond_to(:weight) }
    it { should respond_to(:height) }
  end
end
