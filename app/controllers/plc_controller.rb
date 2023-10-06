require "socket"

class PlcController < ApplicationController

  def show
    @plc = Plc.find(params[:id])
    @ports = @plc.ports
  end
 

  def send_udp_command_to_plc
    require 'pry'; binding.pry
    plc = Plc.find(params[:plc_id])
    plc_port = Port.find(params[:port_id])
    udp_command = params[:udp_command]

    PlcCommunicationService.new(plc.ip_address, plc_port.port_number).send_udp_command(udp_command)

    #redirect to plc show flash[:success] = "Command send successfully!"
  end
end