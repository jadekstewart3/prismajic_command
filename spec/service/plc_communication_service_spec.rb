require 'rails_helper'
require 'socket'

RSpec.describe "PLC Service" do 
  let(:plc_port_1) { PlcPort.new(name: "Prismajic", ip_address:  "192.168.10.21", port: 5002 )}

  it "sends a UDP comand to the PLC" do 
   udp_socket = UDPSocket.new
    command = "incoming"

    expect(udp_socket).to recieve(:send).with(command, 0, plc_port_1.ip_address, plc_port.port)

    expect_any_instance_of(Object).to recieve(:send_udp_command_to_plc)

    send_udp_command_to_plc(command, plc_ip, plc_port)

    udp_socket.close

    expect(response).to be_successful
  end
end