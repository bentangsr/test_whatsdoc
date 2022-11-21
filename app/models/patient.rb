class Patient < ApplicationRecord
  has_one :user, as: :personable
end