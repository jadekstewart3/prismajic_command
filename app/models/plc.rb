class Plc < ApplicationRecord
  has_many :ports
  has_many :coils, through: :ports

  accepts_nested_attributes_for :ports 

  validate :valid_ip_address_format
  validates :name, :ip_address, presence: true

  private

  def valid_ip_address_format
    unless valid_ip_address?(ip_address)
      errors.add(:ip_address, "is not a valid IP address")
    end
  end

  def valid_ip_address?(ip)
    ipv4_regex = /\A\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\z/
    ipv6_regex = /\A([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}\z/
    ip =~ ipv4_regex || ip =~ ipv6_regex
  end
end
