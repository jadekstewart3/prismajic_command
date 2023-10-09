class Port < ApplicationRecord
  belongs_to :plc

  validates :description, :port_number, presence: true
end
