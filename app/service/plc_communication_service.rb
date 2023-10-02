require "socket"

class PLCCommunicationService

  def self.send_udp_command(plc_port, udp_command)
    udp_socket = UDPSocket.new(Socket::AF_INET)
    begin
      udp_socket.send(udp_command, 0, plc_port.ip_address, plc_port.port)

      puts "Command sent successfully to #{plc_port.ip_address}:#{plc_port.port}: #{udp_command}!"
    rescue => e
      puts "Error #{e.message}"
    ensure
      udp_socket.close
    end
  end
end