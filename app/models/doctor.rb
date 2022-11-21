class Doctor < ApplicationRecord
  has_one :user, as: :personable
  belongs_to :specialist
  belongs_to :workspace

  validates :specialist_id, :workspace_id, presence: true
  validates :chat_price, :phone_price, :video_price, numericality: {less_than: 1_000_000.0, greater_than_or_equal_to: 1}
end
