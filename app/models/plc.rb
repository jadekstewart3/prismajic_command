class Plc < ApplicationRecord
  has_many :ports

  validates :name, :ip_address, presence: true
end
