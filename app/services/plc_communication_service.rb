require "socket"
class PlcCommunicationService

  attr_reader :plc_ip, :port_number, :address

  def initialize(plc_ip, port_number, address)
    @plc_ip = plc_ip
    @port_number = port_number
    @address = address
  end

  def send_modbus_command(modbus_command)
    require 'pry'; binding.pry
    modbus_client = ModBus::TCPClient.new(@plc_ip, @port_number, @address)
    response = modbus_client.read_holding_registers(modbus_command[:address], modbus_command[:quantity])
    # look at docs for this method cause you are not calling this with the correct params
    modbus_client.close
    response
  end
end

