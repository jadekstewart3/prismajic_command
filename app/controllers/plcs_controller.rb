require "socket"

class PlcsController < ApplicationController

  def show
    @plc = Plc.find(params[:id])
    @ports = @plc.ports
  end

  def new
    @plc = Plc.new
    @plc.ports.build
  end

  def create
    plc = plc_params
    new_plc = Plc.create(plc)
    if new_plc.save
      redirect_to plc_path(new_plc)
    else
      flash[:error] = new_plc.errors.full_messages.join(", ")
      redirect_to new_plc_path
    end
  end

  def send_modbus_command_to_plc
    begin
      plc = Plc.find(params[:plc_id])
      plc_port = Port.find(params[:port_id])
      plc_coil = Coil.find(params[:coil_address])
      modbus_command = params[:modbus_command]

      plc_service = PlcCommunicationService.new(plc.ip_address, plc_port.port_number, plc_coil)
      plc_service.send_modbus_command(modbus_command)

      flash[:success] = "Command sent successfully!"
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "Please select a port."
    rescue StandardError => e
      flash[:error] = "An error occurred while sending the command: #{e.message}"
    end
    redirect_to plc_path(plc.id) 
  end

  private

  def plc_params
    params.require(:plc).permit(:id, :name, :ip_address, ports_attributes: [:description, :port_number])
  end
end