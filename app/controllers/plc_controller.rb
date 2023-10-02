class PLCController < ApplicationController

  def send_command(command)
    plc_ip = "192.168.10.21"
    plc_port = 5002
    # command = "incoming"

    plc_communicator = PLCService.new(plc_ip, plc_port)
    plc_communicator.send_udp_command(command)
  end
end