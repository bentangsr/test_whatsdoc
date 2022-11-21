class User < ApplicationRecord
  enum :gender, { male: 0, female: 1}, prefix: true, scopes: false

  mount_base64_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  before_validation :normalize_phone

  validates :phone, phone: { possible: true, allow_blank: true}
  validates :email, email: true
  validates :email, :phone, presence: true, uniqueness: true
  validates :name, :gender, :country_id, presence: true

  has_many :clinics, dependent: :destroy
  belongs_to :personable, polymorphic: true

  scope :doctors, -> { where(personable_type: 'Doctor').includes(personable: [:specialist, :workspace]) }
  scope :patients, -> { where(personable_type: 'Patient').includes(:personable) }

  private

  def normalize_phone
    self.phone = Phonelib.parse(phone).full_e164.presence
  end

end