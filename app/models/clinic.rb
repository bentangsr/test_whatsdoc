class Clinic < ApplicationRecord
  belongs_to :user

  validates :email, presence: true, uniqueness: true
  validates :name, :user_id, presence: true
end
