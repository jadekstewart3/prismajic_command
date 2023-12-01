class Coil < ApplicationRecord
  belongs_to :port
  has_one :plc, through: :port

  validates_presence_of :address
end
