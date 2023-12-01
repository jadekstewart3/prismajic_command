require "socket"
class PlcCommunicationService

  attr_reader :plc_ip, :port_number

  def initialize(plc_ip, port_number)
    @plc_ip = plc_ip
    @port_number = port_number
    @udp_socket = TCPSocket.new(@plc_ip, @port_number)
  end

  def send_modbus_command(modbus_command)
    modbus_client = ModBus::TCPClient.new(@plc_ip, @port_number)
    response = modbus_client.read_holding_registers(modbus_command[:address], modbus_command[:quantity])
    modbus_client.close
    response
  end
end