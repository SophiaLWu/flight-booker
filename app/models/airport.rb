class Airport < ApplicationRecord
  validates :code, presence: true, length: 3
end
