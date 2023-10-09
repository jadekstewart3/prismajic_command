require "socket"
class PlcCommunicationService

  attr_reader :plc_ip, :port_number

  def initialize(plc_ip, port_number)
    @plc_ip = plc_ip
    @port_number = port_number
  end

  def send_udp_command(udp_command)
    udp_socket = UDPSocket.new(Socket::AF_INET)

    begin
      udp_socket.send(udp_command, 0, @plc_ip, @port_number)

      puts "Command sent successfully to #{@plc_ip}:#{@plc_port}: #{udp_command}!"
    rescue => e
      puts "Error #{e.message}"
    ensure
      udp_socket.close
    end
  end
end