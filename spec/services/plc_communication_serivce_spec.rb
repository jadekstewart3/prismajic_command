require 'rails_helper'
require 'socket'

RSpec.describe "PLC Service" do 
  describe "send udp command" do
    let(:playground) { Plc.new(name: "playground", ip_address: "192.168.10.21") }
    let(:playground_port_1) { Port.new(description: "led port", port_number: 5002, plc_id: playground.id)}

    it "sends a UDP comand to the PLC" do 
    plc_response = PlcCommunicationService.new(playground.ip_address, playground_port_1.port_number).send_udp_command("1")
# require 'pry'; binding.pry
    expect(plc_response).to be_a(Hash)
    end
  end
end