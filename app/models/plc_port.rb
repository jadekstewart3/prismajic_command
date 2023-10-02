class PlcPort < ApplicationRecord
  validates :name, presence: true
  validates :ip_address, presence: true
  validates :port, presence: true
end
