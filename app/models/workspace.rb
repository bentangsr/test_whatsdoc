class Workspace < ApplicationRecord
  validates :code, presence: true, uniqueness: true
  validates :name, :country_id, presence: true

  has_many :doctors
  belongs_to :country
end
