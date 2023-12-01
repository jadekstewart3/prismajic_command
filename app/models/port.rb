class Port < ApplicationRecord
  belongs_to :plc
  has_many :coils

  accepts_nested_attributes_for :coils
  
  validates :description, :port_number, presence: true
end
