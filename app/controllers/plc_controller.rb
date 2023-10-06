class PlcController < ApplicationController

  def show
    PlcPort.find(params[:id])
  end
  #make a show page for this plc that the form lives on

  def send_udp_command_to_plc
    plc_port = PlcPort.find(params[:plc_port_id])
    udp_command = params[:udp_command]

    PLCCommunicationService.send_udp_command(plc_port, udp_command)

    #redirect to plc show flash[:success] = "Command send successfully!"
  end
end