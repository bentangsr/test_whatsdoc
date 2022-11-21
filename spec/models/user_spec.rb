require 'rails_helper'

RSpec.describe User, type: :model do
  let(:name) { 'users' }
  describe 'Associations' do
    # this class belongs to
    it { should belong_to(:personable) }
    it { should have_many(:clinics) }
  end

  describe 'Attributes' do
    it { should respond_to(:name) }
    it { should respond_to(:phone) }
    it { should respond_to(:address) }
    it { should respond_to(:country_id) }
    it { should respond_to(:gender) }
    it { should respond_to(:secure_pin) }
    it { should respond_to(:secure_pin_checkout) }
    it { should respond_to(:avatar) }
    it { should respond_to(:user_type) }
    it { should respond_to(:user_status) }
    it { should respond_to(:login_status) }
    it { should respond_to(:user_identity_card) }
    it { should respond_to(:fcm_token) }
    it { should respond_to(:personable_type) }
    it { should respond_to(:personable_id) }
    it { should respond_to(:email) }
    it { should respond_to(:encrypted_password) }
    it { should respond_to(:reset_password_token) }
    it { should respond_to(:reset_password_sent_at) }
    it { should respond_to(:remember_created_at) }
    it { should respond_to(:sign_in_count) }
    it { should respond_to(:current_sign_in_at) }
    it { should respond_to(:last_sign_in_at) }
    it { should respond_to(:current_sign_in_ip) }
    it { should respond_to(:last_sign_in_ip) }
  end

  # describe 'validations' do
  #   describe 'of presence' do
  #     # List all attribute that has the validation of presence
  #     attrs = [
  #       :email, :phone, :name, :gender, :country_id, :personable
  #     ]

  #     attrs.each do |att|
  #       it { should validate_presence_of(att) }
  #     end
  #   end
  # end
end
